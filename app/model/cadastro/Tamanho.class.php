<?php
/**
 * Tamanho
 *
 * @version    1.0
 * @package    model
 * @subpackage cadastro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Tamanho extends TRecord
{
    const TABLENAME = 'tamanho';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('tamanho');
    }
}
