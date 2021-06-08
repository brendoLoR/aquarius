<?php

/**
 * DescricaoGastos
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class DescricaoGastos extends TRecord
{
    const TABLENAME = 'descricao_gastos';
    const PRIMARYKEY = 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $tipo_gasto;
    private $periodicidade;
    private $prioridade;

    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('descricao');
        parent::addAttribute('tipos_gasto_id');
        parent::addAttribute('periodicidade_id');
        parent::addAttribute('prioridade_id');
    }
    public function get_tipo_gasto()
    {
        if (empty($this->tipo_gasto)) {
            $this->tipo_gasto = new TipoGasto($this->tipos_gasto_id);
        }
        return $this->tipo_gasto;
    }
    public function get_periodicidade()
    {
        if (empty($this->periodicidade)) {
            $this->periodicidade = new TipoGasto($this->periodicidade_id);
        }
        return $this->periodicidade;
    }
    public function get_prioridade()
    {
        if (empty($this->prioridade)) {
            $this->prioridade = new Prioridade($this->prioridade_id);
        }
        return $this->prioridade;
    }
}
