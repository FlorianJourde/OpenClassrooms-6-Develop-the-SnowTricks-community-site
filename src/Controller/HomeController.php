<?php

namespace App\Controller;

use App\Repository\TricksRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name= "homepage")
     * @param TricksRepository $tricksRepository
     * @return Response
     */
    public function index(TricksRepository $trickRepository): Response
    {
        $trick = $trickRepository->findAll();

        return $this->render('homepage.html.twig', ['nb'=>count($trick)]);
    }
}
