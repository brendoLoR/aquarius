<?php

declare(strict_types=1);

use Phinx\Db\Action\DropTable;
use Phinx\Migration\AbstractMigration;

final class CreateGastosTable extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * https://book.cakephp.org/phinx/0/en/migrations.html#the-change-method
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function up(): void
    {
        $this->execute(
            'CREATE TABLE tipos_gasto(
                id serial primary key,
                tipo_gasto varchar(30)
            );
            
            CREATE TABLE gastos(
                id serial primary key,
                tipo_gasto_id bigint not null,
                valor_gasto float not null,
                data_hora timestamp not null,
                foreign key (tipo_gasto_id) references tipos_gasto(id)
            );
            '
        );
    }
    public function down(Type $var = null)
    {
        $this->execute('
        DROP TABLE tipos_gastos;
        DROP TABLE gastos;
        ');
    }
}
