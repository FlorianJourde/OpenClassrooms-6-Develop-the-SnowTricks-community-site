<?php


namespace App\Controller;

//use Symfony\Component\HttpFoundation\Response;
use App\Entity\Comment;
use App\Entity\Trick;
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
     * @IsGranted("ROLE_EDITOR")
     * @Route("/tricks/add", name="add_trick")
     */
    public function addTrick(Request $request, ManagerRegistry $doctrine): Response
    {
//        if(is_granted('IS_AUTHENTICATED_REMEMBERED')) {
//            return $this->redirectToRoute('app_login');
//        }

        return $this->render('/editor/add_trick.html.twig'/*, ['addTrickForm' => $addTrickForm->createView()]*/);
    }
}