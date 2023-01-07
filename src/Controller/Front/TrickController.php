<?php

namespace App\Controller\Front;

use App\Entity\Comment;
use App\Entity\Trick;
use App\Form\CommentType;
use App\Repository\TrickRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/trick")
 */
class TrickController extends AbstractController
{
    /**
     * @Route("/", name="app_trick_index", methods={"GET"})
     */
    public function index(TrickRepository $trickRepository): Response
    {
        return $this->render('trick/index.html.twig', [
            'tricks' => $trickRepository->findAll(),
        ]);
    }

    /**
     * @Route("/{id}", name="app_trick_show")
     */
    public function show(Trick $trick, Request $request, ManagerRegistry $doctrine): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setCreationDate(new DateTime());
            $comment->setTrick($trick);
            $comment->setStatus(true);
            $em = $doctrine->getManager();
            $em->persist($comment);
            $em->flush();

            return $this->redirectToRoute('app_trick_show', ['id' => $trick->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->render('trick/show.html.twig', ['id' => $trick->getId(), 'trick' => $trick, 'commentForm' => $form->createView()]);
    }
}
