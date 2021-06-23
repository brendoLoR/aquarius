<?php

use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;

/**
 * Movimentacao
 *
 * @version    1.0
 * @package    model
 * @subpackage financeiro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Movimentacao extends TRecord
{
    const TABLENAME = 'movimentacao';
    const PRIMARYKEY = 'id';
    const IDPOLICY =  'serial'; // {max, serial}

    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('timestamp');
        parent::addAttribute('valor');
        parent::addAttribute('mov_id');
        parent::addAttribute('tipo_mov_id');
    }

    static function new_entry($param)
    {
        $mov = new Movimentacao();
        $venda = new Vendas($param['id']);
        $mov->mov_id = $venda->id;
        $mov->tipo_mov_id = 1;
        $mov->valor = isset($param['valor']) ? $mov->valor = $param['valor'] : $mov->valor = $venda->valor_pago;
        $mov->store();
    }
}
