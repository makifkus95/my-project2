<?php

namespace DoctrineMigrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20181203183231 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE product (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(150) DEFAULT NULL, keywords VARCHAR(255) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, type VARCHAR(20) DEFAULT NULL, publisher_id INT DEFAULT NULL, year INT DEFAULT NULL, amount INT DEFAULT NULL, pprice DOUBLE PRECISION DEFAULT NULL, sprice DOUBLE PRECISION DEFAULT NULL, min INT DEFAULT NULL, detail LONGTEXT DEFAULT NULL, image VARCHAR(150) DEFAULT NULL, writer_id INT DEFAULT NULL, category_id INT DEFAULT NULL, user_id INT DEFAULT NULL, status VARCHAR(30) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE category DROP created_at, DROP update_at');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE product');
        $this->addSql('ALTER TABLE category ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP, ADD update_at DATETIME DEFAULT CURRENT_TIMESTAMP');
    }
}
