<?php

namespace App\Controller\Front;

use App\Entity\Trick;
use App\Repository\CommentRepository;
use App\Repository\TrickRepository;
use App\Repository\UserRepository;
use App\Repository\ImageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name= "homepage")
     * @param TrickRepository $tricksRepository
     * @param ImageRepository $imagesRepository
     * @param UserRepository $usersRepository
     * @param CommentRepository $commentsRepository
     * @return Response
     */
    public function index(TrickRepository $tricksRepository, UserRepository $usersRepository, CommentRepository $commentsRepository): Response
    {
        $isAuthenticated = false;

        session_start();

        $tricks = $tricksRepository->findAll();
        $users = $usersRepository->findAll();
        $comments = $commentsRepository->findAll();

        return $this->render('homepage/homepage.html.twig', ['tricks'=>$tricks, 'users'=>count($users), 'comments'=>count($comments), 'is_authenticated'=>$isAuthenticated]);
    }
}
