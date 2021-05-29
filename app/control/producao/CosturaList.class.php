<?php

use Adianti\Base\TStandardList;
use Adianti\Control\TAction;
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
class CosturaList extends TStandardList
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
        // $script = new TElement('script');
        // $script->type = 'text/javascript';
        // $script->add("
        //     $(document).ready(function(){
        //             var query = location.search.slice(1);
        //             var partes = query.split(' & ');
        //             var data = {};
        //             partes.forEach(function (parte) {
        //             var chaveValor = parte.split(' = ');
        //             var chave = chaveValor[0];
        //             var valor = chaveValor[1];
        //             data[chave] = valor;
        //             });
        //             console.log(data);
        //             if data['class'] === 'CosturaList'{
        //                 window.setTimeout(function(){ document.location.reload(true); }, 3000);
        //             }
        //     });
        // ");

        // parent::add($script);
    }
    // public function onReload($param)
    // {
    //     TApplication::loadPage(__CLASS__,'onReload');
    //     $this->loaded = TRUE;
    // }

    /**
     * Item delete action
     */
    public function onItemPronto($param)
    {
        try {
            TTransaction::open('database');
            $venda = new Vendas($param['id']);
            $venda->fase_producao = 3;
            $venda->store();
            TTransaction::close();
        } catch (Exception $e) {
            new TMessage('error', 'ocorreu uma falha, ' . $e->getMessage() . ' contacte o Admin');
        }
        $posAction = new TAction([$this, 'onReload'], $param);
        new TMessage('info', 'Pedido Nº ' . $venda->n_venda . ' Concluido!', $posAction);
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
