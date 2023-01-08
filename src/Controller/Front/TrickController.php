<?php

namespace App\Controller\Front;

use App\Entity\Comment;
use App\Entity\Trick;
use App\Entity\User;
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
    public function show(Trick $trick, Request $request, /*User $user, */ManagerRegistry $doctrine): Response
    {
        $comment = new Comment();
        $commentForm = $this->createForm(CommentType::class, $comment);
        $commentForm->handleRequest($request);

        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            $comment->setCreationDate(new DateTime());
            $comment->setTrick($trick);
            $comment->setStatus(true);
            $comment->setUser($this->getUser());

            $em = $doctrine->getManager();
            $em->persist($comment);
            $em->flush();

            return $this->redirectToRoute('app_trick_show', ['id' => $trick->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->render('trick/show.html.twig', ['id' => $trick->getId(), 'trick' => $trick, 'commentForm' => $commentForm->createView()]);
    }
}
