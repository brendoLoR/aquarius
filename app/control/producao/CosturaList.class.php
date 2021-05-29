<?php

use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;

/**
 * CosturaList
 *
 * @version    1.0
 * @package    control
 * @subpackage producao
 * @author     Brendo
 * @copyright  Copyright (c) 2021 e-code
 * @license    http://www.adianti.com.br/framework-license
 */
class CosturaList extends TPage
{
    public function __construct()
    {
        parent::__construct();
        try {
            TTransaction::open('database');
            $vendas = new TCardView;
            //$vendas->setUseButton();
            $vendas_fase_costura = Vendas::where('fase_producao', '=', 2)->load();
            $items = [];
            foreach ($vendas_fase_costura as $key => $item) {
                $items[] = (object) [
                    'id' => $item->id,
                    'title' => $item->get_cliente()->nome_cliente,
                    'content' => date_format(
                        new DateTime($item->data_entrega_previsto),
                        'd/m/Y'
                    ),
                    'color' => $this->get_color($item->data_entrega_previsto)
                ];
            }

            foreach ($items as $key => $item) {
                $vendas->addItem($item);
            }

            $vendas->setTitleAttribute('title');
            $vendas->setColorAttribute('color');

            //$vendas->setTemplatePath('app/resources/card.html');
            $vendas->setUseButton();
            $vendas->setItemTemplate('<b>Data da Entrega</b>: {content}');
            $view_action = new TAction(['DetalheCosturaView', 'onView'], ['id' => '{id}']);
            $pronto_action = new TAction([$this, 'onItemPronto'], ['id' => '{id}']);
            $vendas->addAction($view_action,   'Ver Detalhes',   'fas:info-circle blue');
            $vendas->addAction($pronto_action, 'Concluir', 'fas:check dark-green');

            // wrap the page content using vertical box
            $vbox = new TVBox;
            $vbox->style = 'width: 100%';
            $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
            $vbox->add($vendas);
            parent::add($vbox);
            TTransaction::close();
        } catch (Exception $e) {
            new TMessage('error', 'erro: ' . $e->getMessage() . 'contacte o Admin');
        }
    }

    /**
     * Item delete action
     */
    public static function onItemPronto($param = NULL)
    {
        new TMessage('info', '<b>onItemPronto</b><br>' . str_replace(',', '<br>', json_encode($param)));
    }
    public function get_color($date)
    {
        $date1 = new DateTime($date);
        $date2 = new DateTime();
        $interval = (int) date_diff($date2, $date1, false)->format("%r%a");
        if ($interval > 5) {
            return '#33e662';
        } elseif ($interval < 5 and $interval > 2) {
            return '#e6a133';
        } elseif ($interval < 2 and $interval > 0) {
            return '#911212';
        } else {
            return '#3b0707';
        }
    }
}
