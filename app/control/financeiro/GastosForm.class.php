<?php
//namespace Adianti\Base;
//use Exception;
use Adianti\Core\AdiantiCoreTranslator;
use Adianti\Base\AdiantiFileSaveTrait;
use Adianti\Control\TWindow;
use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Form\THidden;
use Adianti\Widget\Form\TNumeric;
use Adianti\Widget\Form\TText;
use Adianti\Widget\Wrapper\TDBCombo;

/**
 * GastosForm
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */

class GastosForm extends TWindow
{

    protected $form; // form

    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        parent::setSize(0.8, null);
        parent::removePadding();
        parent::removeTitleBar();
        parent::disableEscape();

        // creates the form
        $this->form = new BootstrapFormBuilder('form_gastos');
        $this->form->setFormTitle('Cadastro de despesas');
        $this->form->setProperty('style', 'margin:0;border:0');
        $this->form->setClientValidation(true);
        $this->form->generateAria();

        // master fields


        // detalhe fields
        $unqid = new THidden('uniqid');
        $id = new THidden('id');
        $descricao_gasto = new TDBUniqueSearch('descricao_gasto_id', 'database', 'DescricaoGastos', 'id', 'descricao');
        $observacao_gasto = new TText('observacao');
        $valor_gasto = new TNumeric('valor_gasto', 2, ',', '.');

        $id->setEditable(false);
        $descricao_gasto->setSize('100%');
        $descricao_gasto->setMinLength(0);
        // add master form fields

        $this->form->addFields(
            [$unqid],
            [$id],

        );
        $this->form->addFields(
            [new TLabel('Drescrição')],
            [$descricao_gasto],
            [new TLabel('Valor')],
            [$valor_gasto]
        );
        $this->form->addFields(
            [new TLabel('Obs.:')],
            [$observacao_gasto],
        );



        $add_gasto = TButton::create('add_gasto', [$this, 'onGastoAdd'], 'Register', 'fa:plus-circle green');
        $add_gasto->getAction()->setParameter('static', '1');
        $this->form->addFields([], [$add_gasto]);

        $this->gastos_list = new BootstrapDatagridWrapper(new TDataGrid);
        $this->gastos_list->setHeight(500);
        $this->gastos_list->makeScrollable();
        $this->gastos_list->setId('gastos_list');
        $this->gastos_list->generateHiddenFields();
        $this->gastos_list->style = "min-width: 700px; width:100%;margin-bottom: 10px";

        $col_unqid     = new TDataGridColumn('unqid', 'unqid', 'center', '5%');
        $col_id     = new TDataGridColumn('id', 'ID', 'center', '10%');
        $col_tipo    = new TDataGridColumn('tipo_gasto', 'Tipo', 'center', '15%');
        $col_descr  = new TDataGridColumn('descricao', 'Descricao', 'left', '15%');
        $col_obs = new TDataGridColumn('detalhe', 'OBS', 'left', '50%');
        $col_valor  = new TDataGridColumn('valor_gasto', 'Valor', 'right', '15%');


        $this->gastos_list->addColumn($col_unqid);
        $this->gastos_list->addColumn($col_id);
        $this->gastos_list->addColumn($col_tipo);
        $this->gastos_list->addColumn($col_descr);
        $this->gastos_list->addColumn($col_obs);
        $this->gastos_list->addColumn($col_valor);


        $col_descr->setTransformer(function ($value) {
            return DescricaoGastos::findInTransaction('database', $value)->descricao;
        });
        $col_tipo->setTransformer(function ($value) {
            $tipo = TipoGasto::findInTransaction('database', DescricaoGastos::findInTransaction('database', $value)->tipos_gasto_id)->tipo_gasto;
            return $tipo;
        });

        $col_valor->enableTotal('sum', 'R$', 2, ',', '.');

        $col_unqid->setVisibility(false);
        $col_id->setVisibility(false);

        // creates two datagrid actions
        $action2 = new TDataGridAction(
            [$this, 'onDeleteItem']
        );
        $action2->setFields(['uniqid', 'id']);


        // add the actions to the datagrid
        $this->gastos_list->addAction(
            $action2,
            _t('Delete'),
            'far:trash-alt red'
        );
        // $this->gastos_list->addAction($action_del);

        $this->gastos_list->createModel();

        $panel = new TPanelGroup;
        $panel->add($this->gastos_list);
        $panel->getBody()->style = 'overflow-x:auto';
        $this->form->addContent([$panel]);

        $format_value_real = function ($value) {
            if (is_numeric($value)) {
                return 'R$ ' . number_format($value, 2, ',', '.');
            }
            return $value;
        };

        $col_valor->setTransformer($format_value_real);

        $this->form->addHeaderActionLink(
            _t('Close'),
            new TAction(
                [__CLASS__, 'onClose'],
                ['static' => '1']
            ),
            'fa:times red'
        );
        $this->form->addAction(
            'Salvar',
            new TAction(
                [$this, 'onSave'],
                ['static' => '1']
            ),
            'fa:save green'
        );
        $this->form->addAction(
            'Limpar',
            new TAction(
                [$this, 'onClear']
            ),
            'fa:eraser red'
        );

        // create the page container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add($this->form);
        parent::add($container);
    }


    /**
     * Clear form
     * @param $param URL parameters
     */
    function onClear($param)
    {
        $this->form->clear();
    }

    /**
     * Add a gasto into item list
     * @param $param URL parameters
     */
    public function onGastoAdd($param)
    {
        $this->form->validate();
        $data = $this->form->getData();
        if (isset($data)) {
            try {
                $uniqid = !empty($data->uniqid) ? $data->uniqid : uniqid();
                $grid_data = [
                    'uniqid'      => $uniqid,
                    'id'          => $data->id,
                    'tipo_gasto'  => (int) $data->descricao_gasto_id,
                    'descricao'   =>  $data->descricao_gasto_id,
                    'detalhe'     => $data->observacao,
                    'valor_gasto' => floatval($data->valor_gasto),
                ];

                // insert row dynamically
                TDataGrid::removeRowById('gastos_list', $uniqid);

                $row = $this->gastos_list->addItem((object) $grid_data);
                $row->id = $uniqid;

                TDataGrid::appendRow('gastos_list', $row);
            } catch (Exception $e) {
                $this->form->setData($this->form->getData());
                new TMessage('error', $e->getMessage());
            }
        }

        // clear gasto form fields after add
        $data->uniqid = '';
        $data->id = '';
        $data->descricao_gasto_id = '';
        $data->observacao = '';
        $data->valor_gasto = '';

        // send data, do not fire change/exit events
        TForm::sendData('form_gastos', $data, false, false);
    }

    /**
     * Delete a gasto from item list
     * @param $param URL parameters
     */
    public static function onDeleteItem($param)
    {
        $data = new stdClass;
        $data->uniqid = '';
        $data->id = '';
        $data->tipo_gasto = '';
        $data->descricao = '';
        $data->detalhe = '';
        $data->valor_gasto = '';

        // send data, do not fire change/exit events
        TForm::sendData('form_gastos', $data, false, false);

        // remove row
        TDataGrid::removeRowById('gastos_list', $param['uniqid']);
    }

    /**
     * Edit venda
     * 
     */
    public function onEdit($param)
    {
    }

    /**
     * Save the gasto and the gasto items
     */
    public function onSave($param)
    {
        // var_dump($param);
        try {
            TTransaction::open('database');


            // Gastos()::where('id_gasto', '=', $gasto->id)->delete();

            if (!empty($param['gastos_list_tipo_gasto'])) {
                foreach ($param['gastos_list_tipo_gasto'] as $key => $item_id) {
                    $item = new Gastos();

                    $item->descricao_gasto_id  = $param['gastos_list_descricao'][$key];
                    $item->valor_gasto  = (float) $param['gastos_list_valor_gasto'][$key];
                    $item->detalhe  = $param['gastos_list_detalhe'][$key];

                    $item->store();
                    Movimentacao::new_out(['id' => $item->id]);
                }
            }
            // $gasto->total = $total;
            $posAction = new TAction(array('GastosList', 'onReload'));
            $posAction->setParameters($param);
            TTransaction::close(); // close the transaction

            new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'), $posAction);
        } catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
            $this->form->setData($this->form->getData()); // keep form data
            TTransaction::rollback();
        }
    }

    /**
     * Closes window
     */
    public static function onClose()
    {
        parent::closeWindow();
    }
}
