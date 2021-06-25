<?php

use Adianti\Control\TAction;
use Adianti\Database\TTransaction;
use Adianti\Widget\Datagrid\TDataGridColumn;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Wrapper\TDBCombo;

/**
 * GastosList
 *
 * @version    1.0
 * @package    control
 * @subpackage financeiro
 * @author     Brendo
 * @copyright  Copyright (c) 2021 e-code
 * @license    http://www.adianti.com.br/framework-license
 */
class GastosList extends TStandardList
{
    protected $form;     // registration form
    protected $datagrid; // listing
    protected $pageNavigation;
    protected $formgrid;
    protected $deleteButton;
    protected $transformCallback;

    /**
     * Page constructor
     * id
     * data_venda
     * id_cliente
     * data_entrega_previsto
     * data_entrega_real
     * observacao
     * id_vendedor
     * fase_producao
     * total
     */
    public function __construct()
    {
        parent::__construct();

        parent::setDatabase('database');            // defines the database
        parent::setActiveRecord('Gastos');   // defines the active record
        parent::setDefaultOrder('id', 'desc');         // defines the default order
        parent::addFilterField('id', '=', 'id'); // filterField, operator, formField
        parent::addFilterField('(SELECT id FROM tipos_gasto WHERE id =(select tipos_gasto_id from descricao_gastos where id = descricao_gasto_id))', '=', 'tipo_gasto'); // filterField, operator, formField

        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Gastos');
        $this->form->setFormTitle('Gastos');

        // create the form fields
        $id = new TEntry('id');
        $descricao = new TDBCombo('tipo_gasto','database','TipoGasto','id','tipo_gasto');

        // add the fields
        $this->form->addFields([new TLabel('Id')], [$id]);
        $this->form->addFields([new TLabel('Tipo')], [$descricao]);


        $id->setSize('30%');
        $descricao->setSize('70%');


        // keep the form filled during navigation with session data
        $this->form->setData(TSession::getValue('Gastos_filter_data'));

        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addAction(_t('New'),  new TAction(array('GastosForm', 'onEdit')), 'fa:plus green');

        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);

        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'Id', 'center', 30);
        $column_descricao = new TDataGridColumn('descricao_gasto->descricao', 'Descriçao', 'left');
        $column_tipo_gasto = new TDataGridColumn('descricao_gasto->tipo_gasto->tipo_gasto', 'Tipo', 'left');
        $column_detail = new TDataGridColumn('detalhe','Detalhe','left');
        $column_date = new TDataGridColumn('data_hora','Data/Hora','center');
        $column_valor = new TDataGridColumn('valor_gasto','Valor','left');
        

        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);  
        $this->datagrid->addColumn($column_tipo_gasto);  
        $this->datagrid->addColumn($column_descricao);
        $this->datagrid->addColumn($column_detail);
        $this->datagrid->addColumn($column_date);
        $this->datagrid->addColumn($column_valor);

        //formaters
        $format_value_real = function ($value) {
            if (is_numeric($value)) {
                return 'R$ ' . number_format($value, 2, ',', '.');
            }
            return $value;
        };

        $column_valor->setTransformer($format_value_real);
        $column_date->setTransformer(array($this, 'formatDateTime'));

        // creates the datagrid column actions
        $order_id = new TAction(array($this, 'onReload'));
        $order_id->setParameter('order', 'id');
        $column_id->setAction($order_id);

        $order_descricao = new TAction(array($this, 'onReload'));
        $order_descricao->setParameter('order', 'descricao_gasto_id');
        $column_descricao->setAction($order_descricao);

        $order_DataPedido = new TAction(array($this, 'onReload'));
        $order_DataPedido->setParameter('order', 'data_hora');
        $column_date->setAction($order_DataPedido);

        $order_valor = new TAction(array($this, 'onReload'));
        $order_valor->setParameter('order', 'valor_gasto');
        $column_valor->setAction($order_valor);

        // create DELETE action
        $action_del = new TDataGridAction(array($this, 'onDelete'));
        $action_del->setButtonClass('btn btn-default');
        $action_del->setLabel(_t('Delete'));
        $action_del->setImage('far:trash-alt red');
        $action_del->setField('id');
        $this->datagrid->addAction($action_del);
        
        // create the datagrid model
        $this->datagrid->createModel();

        // create the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->enableCounters();
        $this->pageNavigation->setAction(new TAction(array($this, 'onReload')));
        $this->pageNavigation->setWidth($this->datagrid->getWidth());

        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);

        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        $container->add($panel);

        parent::add($container);
    }
    public function formatDate($date)
    {
        $dt = new DateTime($date);
        return $dt->format('d/m/Y');
    }
    public function formatDateTime($date)
    {
        $dt = new DateTime($date);
        return $dt->format('d/m/Y - H:i');
    }
   
}
