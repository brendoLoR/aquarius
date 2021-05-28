<?php

use Adianti\Database\TTransaction;

/**
 * Template View pattern implementation
 *
 * @version    1.0
 * @package    vendas
 * @subpackage tutor
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PDFCreate extends TPage
{
    public $venda_id;
    /**
     * Constructor method
     */
    public function __construct($param)
    {
        parent::__construct();
        try {
            TTransaction::open('database');
            if (!isset($this->venda_id)) {
                $this->onEdit($param);
                $venda_id = $this->venda_id;
            } else {
                $venda_id = $this->venda_id;
            }

            $venda = new Vendas($venda_id);
            $produtos = VendaProduto::where('id_venda', '=', $venda->id)->load();
            $cliente = $venda->get_cliente();
            $vendedor_inf = $venda->get_vendedor();
            // create the HTML Renderer
            $this->html = new THtmlRenderer('app/resources/invoice.html');

            // define replacements for the main section
            $invoice = new stdClass;
            $invoice->id   = $venda->id;
            $date = new DateTime();
            $invoice->date =  $date->format('d/m/Y');
            $invoice->order_date = $venda->data_venda;
            $invoice->entrega_date = $venda->data_entrega_previsto;
            $invoice->pay_method = $venda->get_pagamento()->metodo;
            $invoice->shipping = $venda->frete_preco;
            $invoice->tipo_entrega = $venda->get_tipo_entrega()->tipo_entrega;
            $invoice->valor_pago = $venda->valor_pago;
            $invoice->valor_pedido = $venda->get_valor_total();
            $invoice->valor_total = floatval($invoice->valor_pedido) + floatval($venda->frete_preco);
            if ($venda->valor_pago - $invoice->valor_total + $venda->frete_preco < 0) {
                $invoice->troco_sinal = "-";
            } else {
                $invoice->troco_sinal = " ";
            }
            $troco = floatval($venda->valor_pago) - floatval($invoice->valor_total);
            $invoice->troco = abs($troco);
            if (isset($venda->observacao)) {
                $invoice->observacao = $venda->observacao;
            } else {
                $invoice->observacao = "";
            }

            $customer = new stdClass;
            $customer->name       = $cliente->nome_cliente;
            $customer->address    = $cliente->endereco;
            $customer->telefone   = $cliente->telefone;
            $customer->email       = $cliente->email;
            if (isset($cliente->cpf_cnpj)) {
                $customer->cpf_cnpj = $cliente->cpf_cnpj;
            } else if (isset($cliente->cnpj)) {
                $customer->cpf_cnpj = $cliente->cpj_cnpj;
            }else{
                $customer->cpf_cnpj = '999.999.999-99';

            }
            $customer->email       = $cliente->email;

            $shipping = new stdClass;
            $shipping->name       = $cliente->nome_cliente;
            $shipping->address    = $cliente->endereco;

            $vendedor = new stdClass;
            $vendedor->name = $vendedor_inf->name;
            $vendedor->email = $vendedor_inf->email;

            $replace = array();
            $replace['invoice']       = $invoice;
            $replace['customer']      = $customer;
            $replace['shipping']      = $shipping;
            $replace['vendedor']      = $vendedor;
            $replace['items'] = [];
            foreach ($produtos as $item) {
                array_push(
                    $replace['items'],
                    [
                        'code'        => $item->id_produto,
                        'description' => $item->get_produto()->nome_produto,
                        'price'       => $item->get_produto()->preco,
                        'quantity'    => $item->quantidade,
                        'desconto'    => $item->desconto
                    ]

                );
            }

            // replace the main section variables
            $this->html->enableSection('main', $replace);

            // wrap the page content using vertical box
            $vbox = new TVBox;
            $vbox->style = 'width: 100%';
            // $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));

            $panel = new TPanelGroup('invoice');
            // $panel->addHeaderActionLink('Export', new TAction([$this, 'onExportPDF'], ['static' => '1']), 'fa:save');
            $panel->addHeaderActionLink('Export', new TAction([$this, 'onExportPDF'], [
                'static' => '1',
                'id' => $venda_id
            ]), 'fa:save');
            $panel->add($this->html);

            $vbox->add($panel);
            parent::add($vbox);
            TTransaction::close();
        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
        }
    }

    public function onExportPDF($param)
    {
        try {
            // string with HTML contents
            $html = clone $this->html;
            $contents = file_get_contents('app/resources/styles-print.html') . $html->getContents();

            $options = new \Dompdf\Options($attributes = [
                'pdfBackend' => 'CPDF'
            ]);
            $options->setChroot(getcwd());
            // new TMessage('info', getcwd());

            // converts the HTML template into PDF
            $dompdf = new \Dompdf\Dompdf($options);
            $dompdf->loadHtml($contents);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            $file = 'app/output/invoice.pdf';

            // write and open file
            file_put_contents($file, $dompdf->output($options = ['compress' => 0]));

            $window = TWindow::create('invoice', 0.8, 0.8);
            $object = new TElement('object');
            $object->data  = $file . '?rndval=' . uniqid();
            $object->type  = 'application/pdf';
            $object->style = "width: 100%; height:calc(100% - 10px)";
            $window->add($object);
            $window->show();
        } catch (Exception $e) {
            new TMessage('error', $e->getMessage());
        }
    }
    public function onEdit($param)
    {
        $this->venda_id = $param['id'];
    }
}
