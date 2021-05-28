    <?php

    use Adianti\Validator\TCPFValidator;

    /**
     * ClienteList
     *
     * @version    1.0
     * @package    model
     * @subpackage cadastro
     * @author     Brendo Jackson Leite da Silva
     * @copyright  Copyright (c) 2006 Brendo
     */

    class ClienteList extends TPage
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
            $this->setActiveRecord('Cliente'); // define the Active Record
            $this->setDefaultOrder('id', 'asc'); // define the default order
            $this->setLimit(-1); // turn off limit for datagrid

            // create the form
            $this->form = new BootstrapFormBuilder('form_categories');
            $this->form->setFormTitle('Listagem de clientes');

            $radio_enable = new TRadioGroup('enable');
            $radio_enable->addItems(array('1' => 'CPF', '2' => 'CNPJ'));
            $radio_enable->setLayout('horizontal');
            $radio_enable->setValue(1);

            // create the form fields
            $id     = new TEntry('id');
            $cliente   = new TEntry('nome_cliente');
            $telefone   = new TEntry('telefone');
            $email   = new TEntry('email');
            $endereco   = new TEntry('endereco');
            $cpf_cnpj   = new TEntry('cpf_cnpj');

            $cliente->forceUpperCase();

            // add the form fields
            $this->form->addFields([new TLabel('ID')],    [$id]);
            $this->form->addFields([new TLabel('Nome', 'red')],  [$cliente]);
            // $this->form->addFields([],  [$radio_enable]);
            // $this->form->addFields(
            //     [new TLabel('CPF (somente números)', 'red')],
            //     [$cpf_cnpj],
            // );
            $this->form->addFields([new TLabel('Email', 'red')],  [$email]);
            $this->form->addFields([new TLabel('Telefone', 'red')],  [$telefone]);
            $this->form->addFields([new TLabel('Endereço')],  [$endereco]);

            TEntry::enableField('form_categories', 'cpf');
            TEntry::disableField('form_categories', 'cnpj');

            $cliente->addValidation('nome_cliente', new TRequiredValidator);
            $telefone->addValidation('telefone', new TRequiredValidator);
            $email->addValidation('email', new TEmailValidator);




            // define the form actions
            $this->form->addAction('Save', new TAction([$this, 'onSave']), 'fa:save green');
            $this->form->addActionLink('Clear', new TAction([$this, 'onClear']), 'fa:eraser red');
            $radio_enable->setChangeAction(new TAction(array($this, 'onChangeRadio')));
            // make id not editable
            $id->setEditable(FALSE);

            // create the datagrid
            $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
            $this->datagrid->width = '100%';

            // add the columns
            $col_id    = new TDataGridColumn('id', 'Id', 'right', '10%');
            $col_nome  = new TDataGridColumn('nome_cliente', 'cliente', 'left', '70%');
            $col_telefone  = new TDataGridColumn('telefone', 'contato', 'left', '20%');


            $this->datagrid->addColumn($col_id);
            $this->datagrid->addColumn($col_nome);
            $this->datagrid->addColumn($col_telefone);

            $col_id->setAction(new TAction([$this, 'onReload']),   ['order' => 'id']);
            $col_nome->setAction(new TAction([$this, 'onReload']), ['order' => 'nome_cliente']);

            // define row actions
            $action1 = new TDataGridAction([$this, 'onEdit'],   ['key' => '{id}']);
            $action2 = new TDataGridAction([$this, 'onDelete'], ['key' => '{id}']);

            $this->datagrid->addAction($action1, 'Editar',   'far:edit blue');
            $this->datagrid->addAction($action2, 'Deletar', 'far:trash-alt red');

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
        public static function onChangeRadio($value)
        {
            if ($value['enable'] == 1) {
                TEntry::enableField('form_categories', 'cpf');
                TEntry::disableField('form_categories', 'cnpj');
                TEntry::clearField('form_categories', 'cnpj');
            } else {
                TEntry::enableField('form_categories', 'cnpj');
                TEntry::disableField('form_categories', 'cpf');
                TEntry::clearField('form_categories', 'cpf');
            }
        }
        // public function onSave()
        // {
        // }
    }
