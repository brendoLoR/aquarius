<?php
/**
 * Cliente
 *
 * @version    1.0
 * @package    model
 * @subpackage cadastro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Cliente extends TRecord
{
    const TABLENAME = 'clientes';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('nome_cliente');
        parent::addAttribute('telefone');
        parent::addAttribute('endereco');
        parent::addAttribute('email');
        parent::addAttribute('cpf_cnpj');
        
    }
}
