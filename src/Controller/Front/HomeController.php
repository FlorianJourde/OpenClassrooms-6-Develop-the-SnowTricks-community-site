<?php

namespace App\Controller\Front;

use App\Entity\Image;
use App\Entity\Trick;
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

//        $tricks = json_encode($trickRepository->findAll());
//        $tricks = $doctrine->getRepository(Trick::class)->findAll();
        $images = $imageRepository->findAll();
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

//            foreach ($images as $image) {
//                if ($image->getTrick()->getId() === $trick->getId()) {
//                    $tricksArray[] = [
//                        'id' => $trick->getId(),
//                        'name' => $trick->getName(),
//                        'images' => $image->getName(),
//                    ];
//                } else {
//                    $tricksArray[] = [
//                        'id' => $trick->getId(),
//                        'name' => $trick->getName(),
//                'images' => $trick->getImages()
//                    ];
//                    $tricksArray = [
//                        'image' => $image->getName(),
//                    ];
//                }
//            }

//            foreach ($images as $image) {
//                if ($image->getTrick()->getId() === $trick->getId()) {
//                    $tricksArray[] = [
//                        'images' => $image->getName(),
//                    ];
//                }
//            }
//                $imagesArray[] = [
//                    'id' => $image->getTrick()->getId(),
//                    'name' => $image->getName()
//                ];
//        }

//        echo json_encode($image);
//        echo json_encode($trick);
//        echo json_encode($tricksArray);

//        $repository  = $doctrine->getManager()->getRepository(TrickRepository::class);

//        die($tricks);

//        $tricks = $doctrine->getManager()->getRepository(TrickRepository::class)->findAll();

//        $tricks = $tricksRepository->findAll();
//        return new JsonResponse($tricks);
//        $tricks = 'TEST';

//        die($request);
//        die(json_encode($tricksRepository->findAll()));

//        echo $request;
//        echo $tricks;

//        return $tricks;
//        $data = json_decode($request->getContent(), true);

//        die($tricks);

//        return $data;
//        dd($data);

//        if ($this->isCsrfTokenValid('delete'.$image->getId(), $data['_token'])) {
//            $name = $image->getName();
//            unlink($this->getParameter('images_directory') . '/tricks/' . $name);
//
//            $em = $doctrine->getManager();
//            $em->remove($image);
//            $em->flush();
//
//            return new JsonResponse(['success' => 1]);
//        } else {
//            return new JsonResponse(['error' => 'Token invalide.'], 400);
//        }
    }
}
