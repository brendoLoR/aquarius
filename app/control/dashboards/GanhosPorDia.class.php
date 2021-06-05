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
 * GanhosPorDia
 *
 * @version    1.0
 * @package    control
 * @subpackage dashboars
 * @author     Brendo
 * @copyright  Copyright (c) 2021 e-code
 * @license    http://www.adianti.com.br/framework-license
 */

class GanhosPorDia extends TPage
{
    public $ref_mes;
    public $form;
    public $html;
    function __construct($param)
    {

        parent::__construct($show_breadcrumb = true);
        $this->form = new BootstrapFormBuilder('ref_date');

        $ano_referencia = new TCombo("ano");
        $ano_referencia->addItems([
            '2015' => '2015',
            '2016' => '2016',
            '2017' => '2017',
            '2018' => '2018',
            '2019' => '2019',
            '2020' => '2020',
            '2021' => '2021',
            '2022' => '2022',
            '2023' => '2023',
            '2024' => '2024',
            '2025' => '2025',

        ]);
        $mes_referencia = new TCombo("mes");
        $mes_referencia->addItems([
            '01' => 'Janeiro',
            '02' => 'Fevereiro',
            '03' => 'Março',
            '04' => 'Abril',
            '05' => 'Maio',
            '06' => 'junho',
            '07' => 'Julho',
            '08' => 'Agosto',
            '09' => 'Setembro',
            '10' => 'Outubro',
            '11' => 'Novembro',
            '12' => 'Dezembro',
        ]);

        $mes_referencia->setSize("30%");
        $ano_referencia->setSize("30%");
        $mes_referencia->addValidation('mes', new TRequiredValidator);
        $ano_referencia->addValidation('ano', new TRequiredValidator);
        
        $this->form->addFields(
            [new TLabel('Ano referência:')],
            [$ano_referencia],
            [new TLabel('Mês referência:')],
            [$mes_referencia]
        );
        $this->form->addFields();
        $this->form->addAction('Buscar', new TAction([$this, 'onSearch']), 'fas:search green');

        $this->html = new THtmlRenderer('app/resources/google_column_chart.html');
        if (isset($param['ano']) and isset($param['mes'])) {
            $data = $this->getData([
                'mes' => $param['mes'],
                'ano' => $param['ano']
            ]);
            $this->console_log('params');
            $mes = new DateTime($param['ano'].$param['mes']);
            $mes = $mes->format('F');
        } else {
            $date = new DateTime();
            $data = $this->getData([
                'mes' => $date->format('m'),
                'ano' => $date->format('Y')
            ]);
            $this->console_log('dates');
            $mes = $date->format('F');
        }

        $this->console_log($data);
        $this->html->enableSection('main', array(
            // aqui eu tenho que passsar os elementos do meu array
            'data' => json_encode($data),
            'width' => '1100px',
            'height' => '400px',
            'title' => 'Ganhos por dia - '._t($mes),
            'ytitle' => 'R$',
            'xtitle' => 'Dia',
            'uniqud' => uniqid()
        ));
        $panel = new TPanelGroup('Dashboard');

        $table = new TTable;
        $table->border = 0;
        $table->style = 'border-collapse:collapse';
        $table->width = '100%';
        $table->addRowSet($this->form);
        $table->addRowSet($this->html);
        $panel->add($table);

        $container = new TVBox;
        $container->style = 'width: 100%';
        if ($show_breadcrumb) {
            $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        }
        $container->add($panel);
        parent::add($container);
    }
    public function onSearch($param)
    {
        try {
            $this->form->validate();
        $data = $this->getData($param);
        $this->html->enableSection('main', array(
            // aqui eu tenho que passsar os elementos do meu array
            'data' => json_encode($data),
            'width' => '1100px',
            'height' => '400px',
            'title' => 'Ganhos por dia',
            'ytitle' => 'R$',
            'xtitle' => 'Dia',
            'uniqud' => uniqid()
        ));
        } catch (Exception $th) {
            new TMessage('error', $th->getMessage());
        }
        
    }
    public function getData($param)
    {
        try {
            TTransaction::open('database');

            $data[] = ['Dia', 'Recebido', 'Vendido'];

            for ($i = 01; $i < 31; $i++) {
                $date1 = new DateTime($param['ano'] . '-' . $param['mes'] . '-' . $i);
                $date2 = new DateTime($param['ano'] . '-' . $param['mes'] . '-' . intval($i + 1));
                $venda_dia = Vendas::between('data_venda', $date1->format('Y-m-d H:i:s'), $date2->format('Y-m-d H:i:s'))->load();
                $venda_valor = 0;
                $venda_pago = 0;
                $this->console_log(array($date1, $date2));
                foreach ($venda_dia as $key) {
                    $venda_pago += floatval($key->get_valor_pag());
                    $venda_valor += floatval($key->get_valor_total()) + floatval($key->frete_preco);
                };
                $data[] = [$date2->format('d'), $venda_pago, $venda_valor];
            }


            TTransaction::close();
            return $data;
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
