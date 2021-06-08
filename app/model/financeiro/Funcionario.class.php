<?php
/**
 * Funcionario
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Funcionario extends TRecord
{
    const TABLENAME = 'tipos_gasto';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $area;
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('nome'); 
        parent::addAttribute('endereço'); 
        parent::addAttribute('telefone'); 
        parent::addAttribute('cpf'); 
        parent::addAttribute('area_id'); 
        parent::addAttribute('salario'); 
    }
    public function get_area()
    {
        if (empty($this->area)) {
            $this->area = new AreaFuncionario($this->area_id);
        }
        return $this->area;
    }
}