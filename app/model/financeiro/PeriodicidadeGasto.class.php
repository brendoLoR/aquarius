<?php
/**
 * PeriodicidadeGasto
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class PeriodicidadeGasto extends TRecord
{
    const TABLENAME = 'periodicidade_gastos';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('periodicidade');       
    }
}