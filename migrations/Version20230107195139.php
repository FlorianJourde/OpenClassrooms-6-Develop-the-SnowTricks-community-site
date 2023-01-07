<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230107195139 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE specificity_trick (specificity_id INT NOT NULL, trick_id INT NOT NULL, INDEX IDX_BDC251155F69A929 (specificity_id), INDEX IDX_BDC25115B281BE2E (trick_id), PRIMARY KEY(specificity_id, trick_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE specificity_trick ADD CONSTRAINT FK_BDC251155F69A929 FOREIGN KEY (specificity_id) REFERENCES specificity (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE specificity_trick ADD CONSTRAINT FK_BDC25115B281BE2E FOREIGN KEY (trick_id) REFERENCES trick (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE specificity_trick DROP FOREIGN KEY FK_BDC251155F69A929');
        $this->addSql('ALTER TABLE specificity_trick DROP FOREIGN KEY FK_BDC25115B281BE2E');
        $this->addSql('DROP TABLE specificity_trick');
    }
}
