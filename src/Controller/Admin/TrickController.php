<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Image;
use App\Entity\Trick;
use App\Form\CommentType;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use PHPUnit\Util\Json;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/trick")
 * @IsGranted("ROLE_ADMIN")
 */
class TrickController extends AbstractController
{
    /**
     * @Route("/new", name="app_trick_new", methods={"GET", "POST"})
     */
    public function new(Request $request, TrickRepository $trickRepository): Response
    {
        $trick = new Trick();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $trick->setCreationDate(new DateTime());
            $images = $form->get('images')->getData();

            foreach ($images as $image) {
                $file = uniqid() . '.' . $image->guessExtension ();
                $image->move(
                    $this->getParameter('images_directory'),
                    $file
                );
                $img = new Image();
                $img->setName($file);
                $trick->addImage($img);
            }

            $trickRepository->add($trick, true);

            return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/new.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="app_trick_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Trick $trick, TrickRepository $trickRepository): Response
    {
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $trick->setCreationDate(new DateTime());
            $images = $form->get('images')->getData();

            foreach ($images as $image) {
                $file = uniqid() . '.' . $image->guessExtension ();
                $image->move(
                    $this->getParameter('images_directory'),
                    $file
                );
                $img = new Image();
                $img->setName($file);
                $trick->addImage($img);
            }

            $trickRepository->add($trick, true);

            return $this->redirectToRoute('app_trick_edit', ['id' => $trick->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/edit.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_trick_delete", methods={"POST"})
     */
    public function delete(Request $request, Trick $trick, TrickRepository $trickRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$trick->getId(), $request->request->get('_token'))) {
            $trickRepository->remove($trick, true);
        }

        return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/{id}/image/delete", name="app_trick_delete_image", methods={"DELETE"})
     */
    public function deleteImage(Image $image, Request $request, ManagerRegistry $doctrine): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        if ($this->isCsrfTokenValid('delete'.$image->getId(), $data['_token'])) {
            $name = $image->getName();
            unlink($this->getParameter('images_directory') . '/' . $name);

            $em = $doctrine->getManager();
            $em->remove($image);
            $em->flush();

            return new JsonResponse(['success' => 1]);
        } else {
            return new JsonResponse(['error' => 'Token invalide.'], 400);
        }
    }

//    /**
//     * @Route(name="index")
//     */
//    public function index(TrickRepository $trickRepository): Response
//    {
//        $tricks = $trickRepository->findAll();
//        return $this->render('tricks/index.html.twig', ['tricks' => $tricks]);
//    }
//
//    /**
//     * @Route("/{id}", name="details")
//     */
//    public function details(Trick $trick, Request $request, ManagerRegistry $doctrine): Response
//    {
//        $comment = new Comment();
//        $commentForm = $this->createForm(CommentType::class, $comment);
//        $commentForm->handleRequest($request);
//
//        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
//            $comment->setCreationDate(new DateTime());
//            $comment->setTrick($trick);
//            $comment->setStatus(true);
//            $em = $doctrine->getManager();
//            $em->persist($comment);
//            $em->flush();
//
//            return $this->redirectToRoute('trick_details', ['id' => $trick->getId()]);
////            dd($comment);
//        }
//
//        return $this->render('tricks/details.html.twig', ['trick' => $trick, 'commentForm' => $commentForm->createView()]);
//    }

//    /**
//     * @Route("/", name="app_trick_index", methods={"GET"})
//     */
//    public function details(Trick $trick, Request $request, ManagerRegistry $doctrine): Response
//    {
//        $comment = new Comment();
//        $commentForm = $this->createForm(CommentType::class, $comment);
//        $commentForm->handleRequest($request);
//
//        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
//            $comment->setCreationDate(new DateTime());
//            $comment->setTrick($trick);
//            $comment->setStatus(true);
//            $em = $doctrine->getManager();
//            $em->persist($comment);
//            $em->flush();
//
//            return $this->redirectToRoute('app_trick_index', ['id' => $trick->getId()]);
////            dd($comment);
//        }
//
//        return $this->render('trick/index.html.twig', ['trick' => $trick, 'commentForm' => $commentForm->createView()]);
//    }

//    /**
//     * @Route("/", name="app_trick_index", methods={"GET"})
//     */
//    public function index(TrickRepository $trickRepository): Response
//    {
//        return $this->render('trick/index.html.twig', [
//            'tricks' => $trickRepository->findAll(),
//        ]);
//    }

//    /**
//     * @Route("/{id}", name="app_trick_show", methods={"GET"})
//     */
//    public function show(Trick $trick): Response
//    {
////        dd($trick->getImages());
//
//        return $this->render('trick/show.html.twig', [
//            'trick' => $trick,
//        ]);
//    }
}
