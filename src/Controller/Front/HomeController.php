<?php

namespace App\Controller\Front;

use App\Repository\CommentRepository;
use App\Repository\ImageRepository;
use App\Repository\TrickRepository;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
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

        $tricks = $tricksRepository->findAll();
        $users = $usersRepository->findAll();
        $comments = $commentsRepository->findAll();

        return $this->render('homepage/homepage.html.twig', ['tricks'=>$tricks, 'users'=>count($users), 'comments'=>count($comments), 'is_authenticated'=>$isAuthenticated]);
    }

    /**
     * @Route("/load-more", name="app_trick_load_more", methods={"GET", "POST"})
     */
    public function loadMoreTricks(Request $request, TrickRepository $trickRepository, ImageRepository $imageRepository, ManagerRegistry $doctrine): JsonResponse
    {
        $tricks = $trickRepository->findAll();

        foreach ($tricks as $trick) {
            $tricksArray[] = [
                'id' => $trick->getId(),
                'name' => $trick->getName(),
                'images' => $trick->getImages()
            ];
        }

        echo json_encode($tricksArray);
        exit();
    }
}
