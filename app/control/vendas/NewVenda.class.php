<?php
//namespace Adianti\Base;
//use Exception;
use Adianti\Core\AdiantiCoreTranslator;
use Adianti\Base\AdiantiFileSaveTrait;
use Adianti\Control\TWindow;
use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Form\TNumeric;
use Adianti\Widget\Wrapper\TDBCombo;

/**
 * NewVenda
 *
 * @version    1.0
 * @package    model
 * @subpackage vendas
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */

class NewVenda extends TWindow
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
        $this->form = new BootstrapFormBuilder('form_venda');
        $this->form->setFormTitle('Venda');
        $this->form->setProperty('style', 'margin:0;border:0');
        $this->form->setClientValidation(true);
        $this->form->generateAria();

        // master fields
        $id          = new TEntry('id');
        $date        = new TDate('data_venda');
        $cliente_id  = new TDBUniqueSearch('id_cliente', 'database', 'Cliente', 'id', 'nome_cliente');
        $valor_pago  = new TEntry('valor_pag');
        $obs         = new TText('observacao');
        $frete_preco = new TEntry('frete_preco');
        $forma_pagamento  = new TDBCombo('id_pagamento', 'database', 'FormaPagamento', 'id', 'metodo');
        $tipo_entrega    = new TRadioGroup('id_tipo_entrega');
        $tipo_entrega  = new TDBCombo('id_tipo_entrega', 'database', 'TipoEntrega', 'id', 'tipo_entrega');



        $button = new TActionLink('', new TAction(['ClienteList', 'onEdit']), 'green', null, null, 'fa:plus-circle');
        $button->class = 'btn btn-default inline-button';
        $button->title = _t('New');
        $cliente_id->after($button);

        // detalhe fields
        $produto_detalhe_unqid      = new THidden('produto_detalhe_uniqid');
        $produto_detalhe_id         = new TEntry('produto_detalhe_id');
        $produto_detalhe_name       = new THidden('produto_detalhe_name');
        $produto_detalhe_produto_id = new TDBUniqueSearch('produto_detalhe_produto_id', 'database', 'Produto', 'id', 'nome_produto');
        $produto_detalhe_quantidade = new TEntry('produto_detalhe_quantidade');
        $produto_detalhe_desconto   = new TEntry('produto_detalhe_desconto');
        $produto_detalhe_preco      = new TEntry('produto_detalhe_preco');
        $observacao_produto         = new TText('observacao_produto');
        $tamanho_produto_detalhe_id = new TDBCombo('id_tamanho', 'database', 'Tamanho', 'id', 'tamanho');
        $imagem_path                = new TFile('imagem_path');

        $imagem_path->setAllowedExtensions(['gif', 'png', 'jpg', 'jpeg']);

        // enable progress bar, preview
        $imagem_path->enableFileHandling();
        $imagem_path->enablePopover();
        $imagem_path->enableImageGallery();


        // adjust field properties
        $produto_detalhe_preco->setNumericMask(2, ',', '');
        $produto_detalhe_preco->setEditable(false);
        $produto_detalhe_quantidade->setNumericMask(0, ',', '');
        $valor_pago->setNumericMask(2, ',', '.');
        $frete_preco->setNumericMask(2, ',', '.');

        $id->setEditable(false);
        $produto_detalhe_id->setEditable(false);
        $produto_detalhe_unqid->setEditable(false);

        //$cliente_id->setSize('100%');
        $cliente_id->setSize('calc(100% - 30px)');
        $cliente_id->setMinLength(0);
        $date->setSize('100%');
        $obs->setSize('100%', 80);
        $produto_detalhe_produto_id->setSize('100%');
        $produto_detalhe_produto_id->setMinLength(0);
        $produto_detalhe_preco->setSize('30%');
        $produto_detalhe_quantidade->setSize('20%');
        $produto_detalhe_desconto->setSize('20%');
        $observacao_produto->setSize('100%');
        $tamanho_produto_detalhe_id->setSize('30%');
        $imagem_path->setSize('40%');
        $produto_detalhe_id->setSize('20%');
        $frete_preco->setSize('25%');
        $tipo_entrega->setSize('25%');

        // add validations
        $date->addValidation('Date', new TRequiredValidator);
        $cliente_id->addValidation('Customer', new TRequiredValidator);

        // change action
        $produto_detalhe_produto_id->setChangeAction(new TAction([$this, 'onProdutoChange']));

        // add master form fields
        $this->form->addFields(
            [new TLabel('ID')],
            [$id],
            [new TLabel('Data da Entrega (*)', '#FF0000')],
            [$date]
        );
        $this->form->addFields(
            [new TLabel('Cliente (*)', '#FF0000')],
            [$cliente_id],
            [new TLabel('Valor Pago')],
            [$valor_pago]
        );
        $this->form->addFields(
            [new TLabel('Frete:')],
            [$frete_preco],
            [new TLabel('Foram de Pagamento:')],
            [$forma_pagamento]
        );
        $this->form->addFields(
            [new TLabel('Entrega:')],
            [$tipo_entrega]
        );
        $this->form->addFields([new TLabel('Obs')], [$obs]);

        $this->form->addContent(['<h4>detalhes</h4><hr>']);
        $this->form->addFields(
            [$produto_detalhe_unqid],
            [$produto_detalhe_id],
            [$produto_detalhe_name]
        );

        $this->form->addFields(
            [new TLabel('produto (*)', '#FF0000')],
            [$produto_detalhe_produto_id],
            [new TLabel('quantidade(*)', '#FF0000')],
            [$produto_detalhe_quantidade],
            [new TLabel('Tamanho(*)', '#FF0000')],
            [$tamanho_produto_detalhe_id]
        );

        $this->form->addFields(
            [new TLabel('preço (*)', '#FF0000')],
            [$produto_detalhe_preco],
            [new TLabel('desconto (%)')],
            [$produto_detalhe_desconto]
        );
        $this->form->addFields([new TLabel('Arte')], [$imagem_path]);
        $this->form->addFields([new TLabel('OBS')], [$observacao_produto]);

        $add_produto = TButton::create('add_produto', [$this, 'onProdutoAdd'], 'Register', 'fa:plus-circle green');
        $add_produto->getAction()->setParameter('static', '1');
        $this->form->addFields([], [$add_produto]);

        $this->produto_list = new BootstrapDatagridWrapper(new TDataGrid);
        $this->produto_list->setHeight(150);
        $this->produto_list->makeScrollable();
        $this->produto_list->setId('produtos_list');
        $this->produto_list->generateHiddenFields();
        $this->produto_list->style = "min-width: 700px; width:100%;margin-bottom: 10px";

        $col_uniq   = new TDataGridColumn('uniqid', 'Uniqid', 'center', '10%');
        $col_id     = new TDataGridColumn('id', 'ID', 'center', '10%');
        $col_pid    = new TDataGridColumn('produto_id', 'ProdID', 'center', '10%');
        $col_descr  = new TDataGridColumn('produto_id', 'Produto', 'left', '20%');
        $col_tamanho = new TDataGridColumn('id_tamanho_produto', 'Tamanho', 'left', '20%');
        $col_quantidade = new TDataGridColumn('quantidade', 'Quantidade', 'left', '10%');
        $col_preco  = new TDataGridColumn('venda_preco', 'Preço', 'right', '15%');
        $col_disc   = new TDataGridColumn('desconto', 'desconto', 'right', '15%');
        $col_subt   = new TDataGridColumn('total_item', 'Subtotal', 'right', '20%');
        $col_obs    = new TDataGridColumn('observacao_item', 'Subtotal', 'right', '20%');
        $col_img    = new TDataGridColumn('imagem_path', 'Imagem', 'right', '20%');

        $this->produto_list->enablePopover('OBS', "{observacao_item}<p><img style='max-height: 300px' src='download.php?file={imagem_path}'></p>");

        $this->produto_list->addColumn($col_uniq);
        $this->produto_list->addColumn($col_id);
        $this->produto_list->addColumn($col_pid);
        $this->produto_list->addColumn($col_descr);
        $this->produto_list->addColumn($col_tamanho);
        $this->produto_list->addColumn($col_quantidade);
        $this->produto_list->addColumn($col_preco);
        $this->produto_list->addColumn($col_disc);
        $this->produto_list->addColumn($col_subt);
        $this->produto_list->addColumn($col_obs);
        $this->produto_list->addColumn($col_img);

        $col_descr->setTransformer(function ($value) {
            return Produto::findInTransaction('database', $value)->nome_produto;
        });
        $col_tamanho->setTransformer(function ($value) {
            return Tamanho::findInTransaction('database', $value)->tamanho;
        });

        $col_subt->enableTotal('sum', 'R$', 2, ',', '.');

        $col_id->setVisibility(false);
        $col_uniq->setVisibility(false);
        $col_obs->setVisibility(false);
        $col_img->setVisibility(false);

        // creates two datagrid actions
        $action1 = new TDataGridAction(
            [$this, 'onEditItemProduto']
        );
        $action1->setFields(['uniqid', '*']);

        $action2 = new TDataGridAction(
            [$this, 'onDeleteItem']
        );
        $action2->setFields(['uniqid', 'id']);

        // $action_del = new TDataGridAction([$this, 'onDelete']);
        // $action_del->setButtonClass('btn btn-default');
        // $action_del->setLabel(_t('Delete'));
        // $action_del->setImage('far:trash-alt red');
        // $action_del->setField('id');

        // add the actions to the datagrid
        $this->produto_list->addAction(
            $action1,
            _t('Edit'),
            'far:edit blue'
        );
        $this->produto_list->addAction(
            $action2,
            _t('Delete'),
            'far:trash-alt red'
        );
        // $this->produto_list->addAction($action_del);

        $this->produto_list->createModel();

        $panel = new TPanelGroup;
        $panel->add($this->produto_list);
        $panel->getBody()->style = 'overflow-x:auto';
        $this->form->addContent([$panel]);

        $format_value_real = function ($value) {
            if (is_numeric($value)) {
                return 'R$ ' . number_format($value, 2, ',', '.');
            }
            return $value;
        };
        $format_value_porcentagem = function ($value) {
            if (is_numeric($value)) {
                return number_format($value, 2, ',', '.') . ' %';
            }
            return $value;
        };

        $col_preco->setTransformer($format_value_real);
        $col_disc->setTransformer($format_value_porcentagem);
        $col_subt->setTransformer($format_value_real);

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
     * Pre load some data
     */
    public function onLoad($param)
    {
        $data = new stdClass;
        $data->cliente_id   = $param['cliente_id'];
        $this->form->setData($data);
    }


    /**
     * On produto change
     */
    public static function onProdutoChange($params)
    {
        if (!empty($params['produto_detalhe_produto_id'])) {
            try {
                TTransaction::open('database');
                $produto   = new Produto($params['produto_detalhe_produto_id']);
                //$tamanho   = new Tamanho($params['id_tamanho']);
                TForm::sendData(
                    'form_venda',
                    (object) ['produto_detalhe_preco' => $produto->preco]
                );
                TForm::sendData(
                    'form_venda',
                    (object) ['produto_detalhe_name' => $produto->nome_produto]
                );
                //TForm::sendData('form_venda', (object) ['id_tamanho' => $tamanho->id ]);
                TTransaction::close();
            } catch (Exception $e) {
                new TMessage('error', $e->getMessage());
                TTransaction::rollback();
            }
        }
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
     * Add a produto into item list
     * @param $param URL parameters
     */
    public function onProdutoAdd($param)
    {
        $this->form->validate();
        $data = $this->form->getData();
        $total_item =  floatval($data->produto_detalhe_preco) * floatval($data->produto_detalhe_quantidade)
            * 1 - floatval($data->produto_detalhe_desconto) / 100;

        if (!$data->produto_detalhe_id) {
            try {

                if ((!$data->produto_detalhe_produto_id) || (!$data->produto_detalhe_quantidade) || (!$data->produto_detalhe_preco)) {
                    throw new Exception('The fields produto, quantidade and preco are required');
                }

                $uniqid = !empty($data->produto_detalhe_uniqid) ? $data->produto_detalhe_uniqid : uniqid();

                $grid_data = [
                    'uniqid'      => $uniqid,
                    'id'          => $data->produto_detalhe_id,
                    'produto_id'  => $data->produto_detalhe_produto_id,
                    'id_tamanho_produto'  => $data->id_tamanho,
                    'nome_produto_detalhe' => $data->produto_detalhe_name,
                    'quantidade'  => $data->produto_detalhe_quantidade,
                    'venda_preco' => $data->produto_detalhe_preco,
                    'desconto'    => $data->produto_detalhe_desconto,
                    'total_item'  => $total_item,
                    'observacao_item' => $data->observacao_produto,
                    'imagem_path' => $data->imagem_path
                ];

                // insert row dynamically
                TDataGrid::removeRowById('produtos_list', $uniqid);

                $row = $this->produto_list->addItem((object) $grid_data);
                $row->id = $uniqid;

                TDataGrid::appendRow('produtos_list', $row);
            } catch (Exception $e) {
                $this->form->setData($this->form->getData());
                new TMessage('error', $e->getMessage());
            }
        } else {
            TTransaction::open('database');

            $item = new VendaProduto($data->produto_detalhe_id);
            $item->id_produto = $data->produto_detalhe_produto_id;
            $item->id_tamanho = $data->id_tamanho;
            $item->observacao_produto = $data->observacao_produto;
            $item->quantidade = $data->produto_detalhe_quantidade;
            $item->desconto = $data->produto_detalhe_desconto;
            $item->total_item = $total_item;
            $item->imagem_path = $data->imagem_path;

            $item->store();
            TTransaction::close();
            $posAction = new TAction(array('VendaList', 'onReload'));
            $posAction->setParameters($param);
            TTransaction::close(); // close the transaction
            new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'), $posAction);
        }
        // clear produto form fields after add
        $data->produto_detalhe_uniqid     = '';
        $data->produto_detalhe_id         = '';
        $data->produto_detalhe_produto_id = '';
        $data->produto_detalhe_name       = '';
        $data->produto_detalhe_quantidade = '';
        $data->produto_detalhe_preco      = '';
        $data->produto_detalhe_desconto   = '';
        $data->id_tamanho                 = '';
        $data->observacao_produto         = '';
        $data->imagem_path                = '';

        // send data, do not fire change/exit events
        TForm::sendData('form_venda', $data, false, false);
    }

    /**
     * Edit a produto from item list
     * @param $param URL parameters
     */
    public static function onEditItemProduto($param)
    {
        $data = new stdClass;
        $data->produto_detalhe_uniqid     = $param['uniqid'];
        $data->produto_detalhe_id         = $param['id'];
        $data->produto_detalhe_produto_id = $param['produto_id'];
        $data->produto_detalhe_quantidade = $param['quantidade'];
        $data->produto_detalhe_preco      = $param['venda_preco'];
        $data->produto_detalhe_desconto   = $param['desconto'];
        $data->id_tamanho                 = $param['id_tamanho_produto'];
        $data->observacao_produto         = $param['observacao_item'];
        $data->imagem_path                = $param['imagem_path'];

        // send data, do not fire change/exit events
        TForm::sendData('form_venda', $data, false, false);
    }

    /**
     * Delete a produto from item list
     * @param $param URL parameters
     */
    public static function onDeleteItem($param)
    {
        $data = new stdClass;
        $data->produto_detalhe_uniqid     = '';
        $data->produto_detalhe_id         = '';
        $data->produto_detalhe_produto_id = '';
        $data->produto_detalhe_quantidade = '';
        $data->produto_detalhe_preco      = '';
        $data->produto_detalhe_desconto   = '';
        $data->id_tamanho_produto         = '';
        $data->observacao_item            = '';
        $data->imagem_path                = '';

        if (isset($param['id'])) {
            try {
                TTransaction::open('database');
                // delete each record from collection
                $object = new VendaProduto;
                $object->delete($param['id']);

                $posAction = new TAction(array('VendaList', 'onReload'));
                $posAction->setParameters($param);
                new TMessage('info', AdiantiCoreTranslator::translate('Records deleted'), $posAction);

                TTransaction::close();

                $data = new stdClass;
            } catch (Exception $e) {
                new TMessage('error', $e->getMessage());
                TTransaction::rollback();
            }
        }

        // send data, do not fire change/exit events
        TForm::sendData('form_venda', $data, false, false);

        // remove row
        TDataGrid::removeRowById('produtos_list', $param['uniqid']);
    }

    /**
     * Edit venda
     * 
     */
    public function onEdit($param)
    {
        try {
            TTransaction::open('database');

            if (isset($param['key'])) {
                $key = $param['key'];

                $object = new Vendas($key);
                $venda_items = VendaProduto::where('id_venda', '=', $object->id)->load();
                $this->produto_list->clear();
                foreach ($venda_items as $item) {
                    $grid_data = [
                        'uniqid'      => uniqid(),
                        'id'          => $item->id,
                        'produto_id'  => $item->id_produto,
                        'id_tamanho_produto'  => $item->id_tamanho,
                        'nome_produto_detalhe' => $item->produto->nome_produto,
                        'quantidade'  => $item->quantidade,
                        'venda_preco' => $item->produto->preco,
                        'desconto'    => $item->desconto,
                        'total_item'  => $item->total_item,
                        'observacao_item' => $item->observacao_produto,
                        'imagem_path' => $item->imagem_path
                    ];

                    $row = $this->produto_list->addItem((object) $grid_data);
                    $row->id = $item->uniqid;
                }
      
                $this->form->id = $object->id;
                $this->form->data_venda = $object->data_entrega_previsto;
                $this->form->id_cliente = $object->id_cliente;
                $this->form->valor_pag = $object->get_valor_pag();
                $this->form->observacao = $object->observacao;
                $this->form->frete_preco = $object->frete_preco;
                $this->form->id_pagamento = $object->id_pagamento;
                $this->form->id_tipo_entrega = $object->id_tipo_entrega;
                //$this->form->setData($object);
                TTransaction::close();
            } else {
                $this->form->clear();
            }
        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }

    /**
     * Save the venda and the venda items
     */
    public function onSave($param)
    {
        try {
            TTransaction::open('database');

            $data = $this->form->getData();
            $this->form->validate();
            if (!empty($data->id)) {
                $venda = new Vendas($data->id);
            } else {
                $venda = new Vendas;
            }

            $date_now = new DateTime();
            $venda->data_venda = $date_now->format('Y-m-d H:i:s');
            $venda->id_cliente = $data->id_cliente;
            $venda->data_entrega_previsto = $data->data_venda;
            $venda->observacao = $data->observacao;
            $venda->id_vendedor = TSession::getValue('userid');
            $venda->fase_producao = "1";
            $venda->id_pagamento = $data->id_pagamento;
            $venda->id_tipo_entrega = $data->id_tipo_entrega;
            $venda->valor_pago = floatval(str_replace(',', '.', str_replace('.', '', $data->valor_pag)));
            $venda->frete_preco = floatval(str_replace(',', '.', str_replace('.', '', $data->frete_preco)));
            $venda->store();



            // VendaProduto::where('id_venda', '=', $venda->id)->delete();

            $total = 0.0;
            if (!empty($param['produtos_list_produto_id'])) {
                foreach ($param['produtos_list_produto_id'] as $key => $item_id) {
                    if (!isset($param['produtos_list_id'])) {
                        $item = new VendaProduto;
                    } else {
                        $item = new VendaProduto((int) $param['produtos_list_id'][$key]);
                    }

                    //$this->saveFiles($item, $data, 'imagem_path', 'files/images', 'ProdutoImagem', 'imagem_path', 'id_imagem_path');
                    $item->id_produto  = $item_id;
                    $item->quantidade  = (int) $param['produtos_list_quantidade'][$key];
                    $item->desconto    = (float) $param['produtos_list_desconto'][$key];
                    $item->total_item  = (float) $param['produtos_list_total_item'][$key];
                    $item->id_tamanho  = (int) $param['produtos_list_id_tamanho_produto'][$key];
                    $item->observacao_produto = (string) $param['produtos_list_observacao_item'][$key];

                    $item->id_venda = $venda->id;
                    $item->store();
                    $this->saveFile($item, $param['produtos_list_imagem_path'][$key], 'imagem_path', 'files/images');
                    $total += $item->total_item;
                }
            }
            // $venda->total = $total;
            $venda->store(); // stores the object

            TForm::sendData('form_venda', (object) ['id' => $venda->id]);
            $posAction = new TAction(array('VendaList', 'onReload'));
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

    /**
     * Save file
     * @param $object      Active Record
     * @param $data        Form data
     * @param $input_name  Input field name
     * @param $target_path Target file path
     */
    public function saveFile($object, $data, $input_name, $target_path)
    {
        $dados_file = json_decode(urldecode($data));
        //echo $dados_file;
        if (isset($dados_file->fileName)) {
            $pk = $object->getPrimaryKey();

            $target_path .= '/' . $object->$pk;
            $target_path = str_replace('//', '/', $target_path);

            $source_file = $dados_file->fileName;
            $target_file = strpos($dados_file->fileName, $target_path) === FALSE ? $target_path . '/' . $dados_file->fileName : $dados_file->fileName;
            $target_file = str_replace('tmp/', '', $target_file);

            $class = get_class($object);
            $obj_store = new $class($object->$pk);
            $obj_store->$input_name = $target_file;

            $delFile = null;

            if (!empty($dados_file->delFile)) {
                $obj_store->$input_name = '';
                $dados_file->fileName = '';

                if (is_file(urldecode($dados_file->delFile))) {
                    $delFile = urldecode($dados_file->delFile);

                    if (file_exists($delFile)) {
                        unlink($delFile);
                    }
                }
            }

            if (!empty($dados_file->newFile)) {
                if (file_exists($source_file)) {
                    if (!file_exists($target_path)) {
                        if (!mkdir($target_path, 0777, true)) {
                            throw new Exception(AdiantiCoreTranslator::translate('Permission denied') . ': ' . $target_path);
                        }
                    }

                    // if the user uploaded a source file
                    if (file_exists($target_path)) {
                        // move to the target directory
                        if (!rename($source_file, $target_file)) {
                            throw new Exception(AdiantiCoreTranslator::translate('Error while copying file to ^1', $target_file));
                        }

                        $obj_store->$input_name = $target_file;
                    }
                }
            } elseif ($dados_file->fileName != $delFile) {
                $obj_store->$input_name = $dados_file->fileName;
            }

            $obj_store->store();

            if ($obj_store->$input_name) {
                $dados_file->fileName = $obj_store->$input_name;
                $data = urlencode(json_encode($dados_file));
            } else {
                $data = '';
            }

            return $obj_store;
        }
    }
    public function onQuitar($param)
    {
        try {
            TTransaction::open('database');
            $venda = new Vendas($param['id']);
            $venda->valor_pago = floatval($venda->get_valor_total()) + floatval($venda->frete_preco);
            $venda->store();
            TTransaction::close();
            $posAction = new TAction(array($this, 'onEdit'));
            $posAction->setParameters($param);
            new TMessage('info', 'Venda Quitada', $posAction);
        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
        }
    }
}
