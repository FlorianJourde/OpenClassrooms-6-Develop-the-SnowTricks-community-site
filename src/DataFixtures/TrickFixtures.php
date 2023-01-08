<?php

namespace App\DataFixtures;

use App\Entity\Trick;
use App\Repository\TrickRepository;
use DateTime;
use DateTimeZone;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Exception;

class TrickFixtures extends Fixture
{

//    public function __construct(TrickRepository $trickRepository)
//    {
//
//    }
    /**
     * @throws Exception
     */
    public function load(ObjectManager $manager): void
    {
//        for($i = 0; $i < 50; $i++) {
//            $trick = (new Trick())
//                ->setName('Trick ' . $i)
//                ->setCreationDate(new DateTime('now', new DateTimeZone('Europe/Paris')));
//            $manager->persist($trick);
//        }
//        $manager->flush();

        $specificities = [];

        for ($i = 0; $i < 5; $i++) {
            $trick = new Trick();
            $trick->addSpecificity(mt_rand(0, count($specificities) - 1));
//            $trick = $trickRepository->findAll();
//            $trick

            $manager->persist($trick);
        }
        $manager->flush();
    }

//    public function getDependencies()
//    {
//        // TODO: Implement getDependencies() method.
//    }
}