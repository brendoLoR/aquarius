<?php
//namespace Adianti\Base;
//use Exception;
use Adianti\Core\AdiantiCoreTranslator;
use Adianti\Base\AdiantiFileSaveTrait;
use Adianti\Control\TAction;
use Adianti\Control\TWindow;
use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Form\TNumeric;
use Adianti\Widget\Wrapper\TDBCombo;

/**
 * ClienteTWindownForm
 *
 * @version    1.0
 * @package    model
 * @subpackage cadastro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class ClienteTWindownForm extends TWindow
{
    use \Adianti\Base\AdiantiStandardFormTrait;

    protected $form; // form

    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        parent::setSize(0.6, null);
        parent::removePadding();
        parent::removeTitleBar();
        // parent::disableEscape();

        $this->setDatabase('database'); // define the database
        $this->setActiveRecord('Cliente'); // define the Active Record

        // creates the form
        $this->form = new BootstrapFormBuilder('form_cliente_twindow_twindow');
        $this->form->setFormTitle('Venda');
        $this->form->setProperty('style', 'margin:0;border:0');
        $this->form->setClientValidation(true);
        $this->form->generateAria();

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

        TEntry::enableField('form_cliente_twindow', 'cpf');
        TEntry::disableField('form_cliente_twindow', 'cnpj');

        $cliente->addValidation('nome_cliente', new TRequiredValidator);
        $telefone->addValidation('telefone', new TRequiredValidator);
        // $email->addValidation('email', new TEmailValidator);




        // define the form actions
        $this->form->addAction('Save', new TAction([$this, 'onSave']), 'fa:save green');
        $this->form->addActionLink('Clear', new TAction([$this, 'onClear']), 'fa:eraser red');
        $radio_enable->setChangeAction(new TAction(array($this, 'onChangeRadio')));
        // make id not editable
        $id->setEditable(FALSE);


        // $vbox = new TVBox;
        // $vbox->style = 'width: 100%';
        // // $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        parent::add($this->form);
    }
    public static function onChangeRadio($value)
    {
        if ($value['enable'] == 1) {
            TEntry::enableField('form_cliente_twindow', 'cpf');
            TEntry::disableField('form_cliente_twindow', 'cnpj');
            TEntry::clearField('form_cliente_twindow', 'cnpj');
        } else {
            TEntry::enableField('form_cliente_twindow', 'cnpj');
            TEntry::disableField('form_cliente_twindow', 'cpf');
            TEntry::clearField('form_cliente_twindow', 'cpf');
        }
    }
    public static function onClose()
    {
        parent::closeWindow();
    }
    public function onEdit($param)
    {
    }

    public function onSave($param)
    {
        $this->form->validate();
        $form_data = $this->form->getData();

        try {
            TTransaction::open('database');
            $cliente = new Cliente();
            $cliente->nome_cliente = $form_data->nome_cliente;
            $cliente->telefone = $form_data->telefone;
            $cliente->email = $form_data->email;
            $cliente->endereco = $form_data->endereco;
            // $cliente->cpf_cnpj = $form_data->cpf_cnpj;
            $cliente->save();
            TTransaction::close();
            $posAction = new TAction([$this, 'onClose']);
            new TMessage('info', 'Cliente registrado', $posAction);
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
}
