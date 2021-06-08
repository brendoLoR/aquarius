<?php

/**
 * Gastos
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Gastos extends TRecord
{
    const TABLENAME = 'gastos';
    const PRIMARYKEY = 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $descricao_gasto;
    private $funcionario;
    private $caixa;

    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('descricao_gasto_id');
        parent::addAttribute('valor_gasto');
        parent::addAttribute('data_hora');
        parent::addAttribute('detalhe');
        parent::addAttribute('funcionario_id');
        parent::addAttribute('caixa_id');
    }
    public function get_caixa()
    {
        if (empty($this->caixa)) {
            $this->caixa = new FluxoCaixa($this->caixa_id);
        }
        return $this->caixa;
    }
    public function get_descricao_gasto()
    {
        if (empty($this->descricao_gasto)) {
            $this->descricao_gasto = new TipoGasto($this->descricao_gasto_id);
        }
        return $this->descricao_gasto;
    }
    public function get_funcionario()
    {
        if (empty($this->funcionario) && $this->funcionario_id != '1') {
            $this->funcionario = new Funcionario($this->funcionario_id);
        } else {
            $this->funcionario = false;
        }
        return $this->funcionario;
    }
}
