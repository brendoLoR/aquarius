<?php

use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Container\TVBox;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Form\TCombo;
use Adianti\Widget\Form\TDateTime;
use Adianti\Widget\Form\TForm;
use Adianti\Widget\Form\TLabel;
use Adianti\Widget\Template\THtmlRenderer;
use Adianti\Widget\Util\TXMLBreadCrumb;

/**
 * ProdutosMaisVendidos
 *
 * @version    1.0
 * @package    control
 * @subpackage dashboars
 * @author     Brendo
 * @copyright  Copyright (c) 2021 e-code
 * @license    http://www.adianti.com.br/framework-license
 */

class ProdutosMaisVendidos extends TPage
{
    public $ref_mes;
    public $form;
    public $html_produtos;
    function __construct()
    {

        parent::__construct();

        $this->html_produtos = new THtmlRenderer('app/resources/google_bar_chart.html');
        $data = $this->getData();
        $this->console_log($data);
        $this->html_produtos->enableSection('main', array(
            // aqui eu tenho que passsar os elementos do meu array
            'data' => json_encode($data),
            'width' => '400px',
            'height' => '400px',
            'uniqid' => uniqid(),
            'title' => 'Produtos vendidos',
            'ytitle' => 'Nome do Produto',
            'xtitle' => 'Quantidade Vendida',
            'uniqud' => uniqid()
        ));
 
        $container = new TVBox;
        $container->style = 'width: 100%';
        
        $container->add($this->html_produtos);
        parent::add($container);
    }
    
    public function getData()
    {
        try {
            TTransaction::open('database');

            $produtos_vendidos[] = ['Produto', 'Quantidade'];

            $produtos = Produto::all();
            foreach ($produtos as $produto) {
                $produtos_vendidos[] = [$produto->nome_produto, VendaProduto::where('id_produto', '=', $produto->id)->count()];
            }

            TTransaction::close();

            return  $produtos_vendidos;
        } catch (Exception $e) {
            new TMessage('error', 'Ocorreu um erro, contacte o Administrador: ' . $e->getMessage());
        }
    }

    function console_log($data)
    {
        echo '<script>';
        echo 'console.log(' . json_encode($data) . ')';
        echo '</script>';
    }
}
