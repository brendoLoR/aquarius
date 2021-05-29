<?php
//namespace Adianti\Base;
//use Exception;
use Adianti\Core\AdiantiCoreTranslator;
use Adianti\Base\AdiantiFileSaveTrait;
use Adianti\Control\TWindow;
use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Form\TNumeric;
use Adianti\Widget\Wrapper\TDBCombo;

/**
 * DetalheCosturaView
 *
 * @version    1.0
 * @package    model
 * @subpackage producao
 * @author     Brendo Jackson Leite da Silva
 * @copyright  Copyright (c) 2006 Brendo
 */

class DetalheCosturaView extends TWindow
{

    protected $produto_list; // datagrig

    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        parent::setSize(0.8, null);
        parent::removePadding();
        // parent::removeTitleBar();
        $this->produto_list = new BootstrapDatagridWrapper(new TDataGrid);
        $this->form = new BootstrapFormBuilder('form_costura');
        $this->produto_list->width = '100%';

        // add the columns
        $this->produto_list->addColumn(new TDataGridColumn('id', 'id', 'center', '5%'));
        $this->produto_list->addColumn(new TDataGridColumn('description', 'Descrição', 'left', '15%'));
        $column = $this->produto_list->addColumn(new TDataGridColumn('imagem_path', 'Arte', 'center', '50%'));
        $this->produto_list->addColumn(new TDataGridColumn('observacao_produto', 'OBS.:', 'center', '40%'));

        // define the transformer method over image
        $column->setTransformer(function ($image) {
            $image = new TImage($image);
            $image->style = 'max-width: 240px';
            return $image;
        });
       
        $this->produto_list->createModel();
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add($this->produto_list);
        
        parent::add($container);
    }
    public function onView($param)
    {
        try {
            TTransaction::open('database');
            $itens = VendaProduto::where('id_venda', '=', $param['id'])->load();
            $this->produto_list->clear();
            foreach ($itens as $key) {
                $item = new stdClass;
                $item->id = $key->id;
                $item->description = $key->get_produto()->nome_produto;
                $item->imagem_path = $key->imagem_path;
                $item->observacao_produto = $key->observacao_produto;
                $this->produto_list->addItem($item);
            }
            TTransaction::close();
        } catch (Exception $e) {
            new TMessage('error', 'erro: ' . $e->getMessage() . 'contacte o Admin');
        }
    }

}
