<?php

namespace App\Controller;

use App\Repository\CommentRepository;
use App\Repository\TrickRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name= "homepage")
     * @param TrickRepository $tricksRepository
     * @param UserRepository $usersRepository
     * @param CommentRepository $commentsRepository
     * @return Response
     */
    public function index(TrickRepository $tricksRepository, UserRepository $usersRepository, CommentRepository $commentsRepository): Response
    {
        $isAuthenticated = false;

        session_start();

        if (!empty($_SESSION)) {
            var_dump($_SESSION['_sf2_attributes']['_security_main']);
            $isAuthenticated = true;
        } else {
            $isAuthenticated = false;
        }

        $tricks = $tricksRepository->findAll();
        $users = $usersRepository->findAll();
        $comments = $commentsRepository->findAll();

        return $this->render('homepage.html.twig', ['tricks'=>count($tricks), 'users'=>count($users), 'comments'=>count($comments), 'is_authenticated'=>$isAuthenticated]);
    }
}
