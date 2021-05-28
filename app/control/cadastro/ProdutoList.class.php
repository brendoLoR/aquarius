    <?php

use Adianti\Database\TTransaction;
use Adianti\Widget\Form\TDate;
use Adianti\Widget\Form\TNumeric;

/**
     * ProdutoList
     *
     * @version    1.0
     * @package    model
     * @subpackage cadastro
     * @author     Brendo Jackson Leite da Silva
     * @copyright  Copyright (c) 2006 Brendo
     */

    class ProdutoList extends TPage
    {
        protected $form;      // form
        protected $datagrid;  // datagrid
        protected $loaded;
        protected $pageNavigation;  // pagination component
        
        // trait with onSave, onEdit, onDelete, onReload, onSearch...
        use \Adianti\Base\AdiantiStandardFormListTrait;
        
        /**
         * Class constructor
         * Creates the page, the form and the listing
         */
        public function __construct()
        {
            parent::__construct();
            
            $this->setDatabase('database'); // define the database
            $this->setActiveRecord('Produto'); // define the Active Record
            $this->setDefaultOrder('id', 'asc'); // define the default order
            $this->setLimit(-1); // turn off limit for datagrid
            
            // create the form
            $this->form = new BootstrapFormBuilder('form_categories');
            $this->form->setFormTitle('Listagem de produtos');
            
            // create the form fields
            $id     = new TEntry('id');
            $produto   = new TEntry('nome_produto');
            $preco   = new TNumeric('preco', 2, ',', '.');

            // add the form fields
            $this->form->addFields( [new TLabel('ID')],    [$id] );
            $this->form->addFields( [new TLabel('produto', 'red')],  [$produto] );
            $this->form->addFields( [new TLabel('preço', 'red')],  [$preco] );

            
            $produto->addValidation('produto', new TRequiredValidator);
            
            // define the form actions
            $this->form->addAction( 'Salvar', new TAction([$this, 'onSave']), 'fa:save green');
            $this->form->addActionLink( 'Limpar',new TAction([$this, 'onClear']), 'fa:eraser red');
            
            // make id not editable
            $id->setEditable(FALSE);
            
            // create the datagrid
            $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
            $this->datagrid->width = '100%';
            
            // add the columns
            $col_id    = new TDataGridColumn('id', 'Id', 'right', '10%');
            $col_produto  = new TDataGridColumn('nome_produto', 'produto', 'left', '70%');
            $col_preco  = new TDataGridColumn('preco', 'preço', 'left', '20%');
            
            $format_value_real = function($value) {
                if (is_numeric($value)) {
                    return 'R$ '.number_format($value, 2, "," , ".");
                }
                return $value;
            };
            $col_preco->setTransformer( $format_value_real );

            $this->datagrid->addColumn($col_id);
            $this->datagrid->addColumn($col_produto);
            $this->datagrid->addColumn($col_preco);
            
            $col_id->setAction( new TAction([$this, 'onReload']),   ['order' => 'id']);
            $col_produto->setAction( new TAction([$this, 'onReload']), ['order' => 'produto']);
            $col_preco->setAction( new TAction([$this, 'onReload']), ['order' => 'preco']);

            // define row actions
            $action1 = new TDataGridAction([$this, 'onEdit'],   ['key' => '{id}'] );
            $action2 = new TDataGridAction([$this, 'onDelete'], ['key' => '{id}'] );
            
            $this->datagrid->addAction($action1, 'Edit',   'far:edit blue');
            $this->datagrid->addAction($action2, 'Delete', 'far:trash-alt red');
           
            // create the datagrid model
            $this->datagrid->createModel();
            
            // wrap objects inside a table
            $vbox = new TVBox;
            $vbox->style = 'width: 100%';
            $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
            $vbox->add($this->form);
            $vbox->add(TPanelGroup::pack('', $this->datagrid));
            
            // pack the table inside the page
            parent::add($vbox);
        }
        
        public function onSave($param)
        {
        try
            {
                TTransaction::open('database');
                
                $data = $this->form->getData();
                $this->form->validate();
                if(!empty($data->id)){
                    $produto = new Produto($data->id);
                }else{
                    $produto = new Produto;
                }
                
                $produto->nome_produto = $data->nome_produto; 
                $produto->preco = floatval($data->preco);
                
                $produto->store();
                               
                TForm::sendData('form_produto', (object) ['id' => $produto->id]);
                
                TTransaction::close(); // close the transaction
                new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'));
                $this->onReload();
            }
            catch (Exception $e) // in case of exception
            {
                new TMessage('error', $e->getMessage());
                $this->form->setData( $this->form->getData() ); // keep form data
                TTransaction::rollback();
            }
        }

    }

