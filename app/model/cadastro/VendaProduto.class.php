<?php
/**
 * VendaProduto
 *
 * @version    1.0
 * @package    model
 * @subpackage cadastro
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */
class VendaProduto extends TRecord
{
    const TABLENAME = 'venda_produto';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    private $venda;
    private $produto;
    private $tamanho;
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL)
    {
        parent::__construct($id);
        parent::addAttribute('id_venda');
        parent::addAttribute('id_produto');
        parent::addAttribute('id_tamanho');
        parent::addAttribute('observacao_produto');
        parent::addAttribute('quantidade');
        parent::addAttribute('desconto');
        parent::addAttribute('total_item');
        parent::addAttribute('imagem_path');

        
    }

    public function get_venda(){
        if(empty($this->venda)){
            $this->venda = new Vendas($this->id_venda);
        }
        return $this->venda;
    }
    public function get_produto(){
        if(empty($this->produto)){
            $this->produto = new Produto($this->id_produto);
        }
        return $this->produto;
    }
    public function get_tamanho(){
        if(empty($this->tamanho)){
            $this->tamanho = new Tamanho($this->id_tamanho);
        }
        return $this->tamanho;
    }
}
