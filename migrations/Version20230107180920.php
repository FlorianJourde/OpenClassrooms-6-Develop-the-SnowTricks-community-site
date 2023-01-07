<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230107180920 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE specificity ADD trick_id INT NOT NULL');
        $this->addSql('ALTER TABLE specificity ADD CONSTRAINT FK_EA204E50B281BE2E FOREIGN KEY (trick_id) REFERENCES trick (id)');
        $this->addSql('CREATE INDEX IDX_EA204E50B281BE2E ON specificity (trick_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE specificity DROP FOREIGN KEY FK_EA204E50B281BE2E');
        $this->addSql('DROP INDEX IDX_EA204E50B281BE2E ON specificity');
        $this->addSql('ALTER TABLE specificity DROP trick_id');
    }
}
