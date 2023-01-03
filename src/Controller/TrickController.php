<?php


namespace App\Controller;

//use Symfony\Component\HttpFoundation\Response;
use App\Entity\Comment;
use App\Entity\Trick;
use App\Form\CommentType;
use App\Repository\TrickRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TrickController extends AbstractController
{
    /**
     * @Route("/tricks", name="tricks")
     */
    public function index(TrickRepository $trickRepository): Response
    {
        $tricks = $trickRepository->findAll();
        return $this->render('tricks/index.html.twig', ['tricks' => $tricks]);
    }

    /**
     * @Route("/tricks/{id}", name="trick_details")
     */
    public function details(Trick $trick, Request $request, ManagerRegistry $doctrine): Response
    {
//        dd($trick->getId());
        $comment = new Comment();
        $commentForm = $this->createForm(CommentType::class, $comment);
        $commentForm->handleRequest($request);

        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            $comment->setCreationDate(new DateTime());
            $comment->setTrick($trick);
            $comment->setStatus(true);
            $em = $doctrine->getManager();
            $em->persist($comment);
            $em->flush();

            return $this->redirectToRoute('trick_details', ['id' => $trick->getId()]);
//            dd($comment);
        }

        return $this->render('tricks/details.html.twig', ['trick' => $trick, 'commentForm' => $commentForm->createView()]);
    }

    /**
     * @Route("/admin/tricks/add", name="add_trick")
     */
    public function addTrick(Request $request, ManagerRegistry $doctrine): Response
    {
//        if(is_granted('IS_AUTHENTICATED_REMEMBERED')) {
//            return $this->redirectToRoute('app_login');
//        }

        return $this->render('/admin/add_trick.html.twig'/*, ['addTrickForm' => $addTrickForm->createView()]*/);
    }
}