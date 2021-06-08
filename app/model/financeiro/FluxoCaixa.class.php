<?php
/**
 * FluxoCaixa
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class FluxoCaixa extends TRecord
{
    const TABLENAME = 'fluxo_caixa';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('dia_ref');       
        parent::addAttribute('saldo');       
    }

}