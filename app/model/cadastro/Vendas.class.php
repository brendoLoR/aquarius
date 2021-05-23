<?php
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
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $vendendor;
    private $cliente;
    
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
        parent::addAttribute('total');
        parent::addAttribute('valor_pago');

    }

    public function get_vendendor(){
        if(empty($this->vendendor)){
            $this->vendendor = new SystemUser($this->id_vendendor);
        }
        return $this->vendendor;
    }

    public function get_cliente(){
        if(empty($this->cliente)){
            $this->cliente = new Cliente($this->id_cliente);
        }
        return $this->cliente;
    }

}
