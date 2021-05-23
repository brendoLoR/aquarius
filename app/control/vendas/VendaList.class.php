<?php
/**
 * VendaList
 *
 * @version    1.0
 * @package    control
 * @subpackage vendas
 * @author     Brendo
 * @copyright  Copyright (c) 2021 e-code
 * @license    http://www.adianti.com.br/framework-license
 */
class VendaList extends TStandardList
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
        parent::setActiveRecord('Vendas');   // defines the active record
        parent::setDefaultOrder('id', 'desc');         // defines the default order
        parent::addFilterField('id', '=', 'id'); // filterField, operator, formField
        parent::addFilterField('(select nome_cliente from clientes where id = id_cliente)', 'like', 'nome_cliente'); // filterField, operator, formField
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_Vendas');
        $this->form->setFormTitle('Vendas');
        
        // create the form fields
        $id = new TEntry('id');
        $name = new TEntry('nome_cliente');

        $name->forceUpperCase();
        
        // add the fields
        $this->form->addFields( [new TLabel('Id')], [$id] );
        $this->form->addFields( [new TLabel('Nome Cliente')], [$name] );


        $id->setSize('30%');
        $name->setSize('70%');

        
        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('Vendas_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction(array($this, 'onSearch')), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addAction(_t('New'),  new TAction(array('NewVenda', 'onEdit')), 'fa:plus green');
        
        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);
        
        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'Id', 'center', 50);
        $column_cliente = new TDataGridColumn('cliente->nome_cliente', 'Cliente', 'left');
        $column_DataPedido = new TDataGridColumn('data_venda', 'Data/hora da venda', 'left');
        $column_DataPrevEntrega = new TDataGridColumn('data_entrega_previsto', 'Data Previsão de entrega', 'left');
        $column_total = new TDataGridColumn('total', 'Valor Total', 'left');
        $column_valor_pago = new TDataGridColumn('valor_pago', 'Valor Pago', 'left');
        $column_valor_restante = new TDataGridColumn('={total} - {valor_pago}', 'Resta a pagar', 'left');



        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_cliente);
        $this->datagrid->addColumn($column_DataPedido);
        $this->datagrid->addColumn($column_DataPrevEntrega);
        $this->datagrid->addColumn($column_total);
        $this->datagrid->addColumn($column_valor_pago);
        $this->datagrid->addColumn($column_valor_restante);

        //formaters
        $format_value_real = function($value) {
            if (is_numeric($value)) {
                return 'R$ '.number_format($value, 2, ',', '.');
            }
            return $value;
        };
        $format_value_porcentagem = function($value) {
            if (is_numeric($value)) {
                return number_format($value, 2, ',', '.').' %';
            }
            return $value;
        };

        $column_total->setTransformer($format_value_real);
        $column_valor_pago->setTransformer($format_value_real);
        $column_valor_restante->setTransformer($format_value_real);

        

        // creates the datagrid column actions
        $order_id = new TAction(array($this, 'onReload'));
        $order_id->setParameter('order', 'id');
        $column_id->setAction($order_id);
        
        $order_cliente = new TAction(array($this, 'onReload'));
        $order_cliente->setParameter('order', 'nome');
        $column_cliente->setAction($order_cliente);
        
        $order_DataPedido = new TAction(array($this, 'onReload'));
        $order_DataPedido->setParameter('order', 'sigla');
        $column_DataPedido->setAction($order_DataPedido);
        
        $order_DataPrevEntrega = new TAction(array($this, 'onReload'));
        $order_DataPrevEntrega->setParameter('order', 'sigla');
        $column_DataPrevEntrega->setAction($order_DataPrevEntrega);
        
        $order_total = new TAction(array($this, 'onReload'));
        $order_total->setParameter('order', 'sigla');
        $column_total->setAction($order_total);

        // create EDIT action
        $action_edit = new TDataGridAction(array('NewVenda', 'onEdit'));
        $action_edit->setButtonClass('btn btn-default');
        $action_edit->setLabel(_t('Edit'));
        $action_edit->setImage('far:edit blue');
        $action_edit->setField('id');
        $this->datagrid->addAction($action_edit);
        
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
    
}
