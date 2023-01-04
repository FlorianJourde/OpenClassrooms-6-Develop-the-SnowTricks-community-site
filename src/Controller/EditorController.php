<?php


namespace App\Controller;

//use Symfony\Component\HttpFoundation\Response;
use App\Entity\Comment;
use App\Entity\Trick;
use App\Form\AddTrickType;
use App\Form\CommentType;
use App\Repository\TrickRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/editor", name="app_editor_")
 */
class EditorController extends AbstractController
{
    /**
//     * @IsGranted("ROLE_EDITOR")
     * @Route("/tricks/add", name="add_trick")
     */
    public function addTrick(Request $request, ManagerRegistry $doctrine): Response
    {
//        dd($request);
//        die('test');
        $trick = new Trick();
        $form = $this->createForm(AddTrickType::class, $trick);
        $form->handleRequest($request);
//
        if ($form->isSubmitted() && $form->isValid()) {
//            dd($request);
//            dd($trick->getName());
            $trick->setName($trick->getName());
            $trick->setCreationDate(new DateTime());
            $em = $doctrine->getManager();
            $em->persist($trick);
            $em->flush();
//            $em = $this->getDoctrine()->getManager();
//            $em->persist($trick);
//            $em->flush();

            $this->addFlash('message', 'Trick ajouté avec succès.');
            return $this->redirectToRoute('app_tricks_index');
        }

        return $this->render('/editor/add_trick.html.twig', ['addTrickForm' => $form->createView()]);
    }
}