<?php

namespace App\DataFixtures;

use App\Entity\Trick;
use DateTime;
use DateTimeZone;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Exception;

class TrickFixtures extends Fixture
{
    /**
     * @throws Exception
     */
    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 5; $i++) {
            $trick = (new Trick())
                ->setName('Trick ' . $i)
                ->setCreationDate(new DateTime('now', new DateTimeZone('Europe/Paris')));
            $manager->persist($trick);
        }
        $manager->flush();
    }
}