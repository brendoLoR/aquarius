<?php

use Adianti\Widget\Dialog\TMessage;

/**
 * Vendas
 *
 * @version    1.0
 * @package    model
 * @subpackage cadastro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class Vendas extends TRecord
{
    const TABLENAME = 'vendas';
    const PRIMARYKEY = 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $vendedor;
    private $cliente;
    private $valor_total;
    private $valor_pag;
    private $pagamento;
    private $tipo_entrega;
    private $caixa;
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('data_venda');
        parent::addAttribute('data_entrega_previsto');
        parent::addAttribute('data_entrega_real');
        parent::addAttribute('observacao');
        parent::addAttribute('id_vendedor');
        parent::addAttribute('fase_producao');
        parent::addAttribute('id_cliente');
        parent::addAttribute('frete_preco');
        parent::addAttribute('id_pagamento');
        parent::addAttribute('valor_pago');
        parent::addAttribute('id_tipo_entrega');
        parent::addAttribute('n_venda');
        parent::addAttribute('caixa_id');
    }

    public function get_caixa()
    {
        if (empty($this->caixa)) {
            $this->caixa = new FluxoCaixa($this->caixa_id);
        }
        return $this->caixa;
    }
    public function get_vendedor()
    {
        if (empty($this->vendedor)) {
            $this->vendedor = new SystemUser($this->id_vendedor);
        }
        return $this->vendedor;
    }
    public function get_pagamento()
    {
        if (empty($this->pagamento)) {
            $this->pagamento = new FormaPagamento($this->id_pagamento);
        }
        return $this->pagamento;
    }

    public function get_cliente()
    {
        if (empty($this->cliente)) {
            $this->cliente = new Cliente($this->id_cliente);
        }
        return $this->cliente;
    }

    public function get_tipo_entrega()
    {
        if (empty($this->tipo_entrega)) {
            $this->tipo_entrega = new TipoEntrega($this->id_tipo_entrega);
        }
        return $this->tipo_entrega;
    }
    public function get_valor_pag()
    {
        $this->valor_pag = new Vendas($this->id);
        return number_format($this->valor_pag->valor_pago, 2, ',', '.');
    }
    public function get_valor_total()
    {
        $this->valor_total = 0;
        $valor_item = VendaProduto::where('id_venda', '=', $this->id)->load();

        foreach ($valor_item as $valor) {
            $this->valor_total += $valor->total_item;
        }
        return $this->valor_total;
    }
    // public function onBeforeStore($object)
    // {
    //     try {
    //         TTransaction::open('database');
    //         $today = new Date();
    //         if (!isset($object->id)) {
    //             if (!$caixa = FluxoCaixa::where($today, '=', 'dia_ref')->load()) {
    //                 $caixa = new FluxoCaixa();
    //                 $caixa->save();
    //                 $saldo_anterior = new FluxoCaixa($caixa->id - 1);
    //                 $caixa->saldo = floatval($saldo_anterior->saldo) + floatval($object->get_valor_pag());
    //                 $caixa->save();
    //             }else{
    //                 $caixa->saldo = floatval($caixa->saldo) + floatval($object->get_valor_pag());
    //             }
    //         }else{
                
    //         }
    //         TTransaction::close();
    //         $this->caixa_id = $caixa->id;
    //     } catch (Exepetion $e) {
    //         new TMessage('error', 'Ocorreu um erro: ' . $e->getMessage() . ' caontacte o administrador');
    //     }
    // }
}
