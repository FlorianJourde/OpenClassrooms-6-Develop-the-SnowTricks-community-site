<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Image;
use App\Entity\Specificity;
use App\Entity\Trick;
use App\Form\TrickType;
use App\Repository\CommentRepository;
use App\Repository\SpecificityRepository;
use App\Repository\TrickRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/trick")
 * @IsGranted("ROLE_EDITOR")
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
     * @Route("/new", name="app_trick_new", methods={"GET", "POST"})
     */
    public function new(Request $request, TrickRepository $trickRepository, SpecificityRepository $specificityRepository): Response
    {
        $tricksNames = [];

        foreach ($trickRepository->findAll() as $trickName) {
            $tricksNames[] = $trickName->getName();
        }

        $trick = new Trick();
        $specificities = $specificityRepository->findAll();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $trick->setUser($this->getUser());
            $this->isUnique($trick->getName(), $tricksNames);
            $this->addImages($form, $trick, $trickRepository);
            $this->addVideo($trick, $trickRepository);

            return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/new.html.twig', [
            'trick' => $trick,
            'trickForm' => $form,
            'specificities' => $specificities
        ]);
    }

    /**
     * @Route("/{slug}/edit", name="app_trick_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Trick $trick, TrickRepository $trickRepository, SpecificityRepository $specificityRepository): Response
    {

        $tricksNames = [];
        $previousTrickName = $trick->getName();

        foreach ($trickRepository->findAll() as $trickName) {
            $tricksNames[] = $trickName->getName();
        }

        $currentVideoLink = $trick->getVideo();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);
        $specificities = $specificityRepository->findAll();
        $currentSpecificities = $trick->getSpecificities();
        $selectedSpecificitiesId = [];
        $selectedSpecificities = [];
        $unselectedSpecificities = [];

        foreach ($currentSpecificities as $currentSpecificity) {
            $selectedSpecificitiesId[] = $currentSpecificity->getId();
        }

        foreach ($specificities as $specificity) {
            if (!(in_array($specificity->getId(), $selectedSpecificitiesId))) {
                $unselectedSpecificities[] = $specificity;
            } else {
                $selectedSpecificities[] = $specificity;
            }
        }

        if ($form->isSubmitted() && $form->isValid()) {
            $trick->setUser($this->getUser());
            $this->isUnique($trick->getName(), $tricksNames, $previousTrickName);
            $this->addImages($form, $trick, $trickRepository);

            if ($currentVideoLink !== $form->get('video')->getData()) {
                $this->addVideo($trick, $trickRepository);
            }

            return $this->redirectToRoute('app_trick_show', ['slug' => $trick->getSlug()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/edit.html.twig', [
            'trick' => $trick,
            'trickForm' => $form,
            'unselectedSpecificities' => $unselectedSpecificities,
            'selectedSpecificities' => $selectedSpecificities,
        ]);
    }

    /**
     * @Route("/{id}/delete", name="app_trick_delete", methods={"POST"})
     */
    public function delete(Request $request, Trick $trick, TrickRepository $trickRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$trick->getId(), $request->request->get('_token'))) {
            $trickRepository->remove($trick, true);
        }

        return $this->redirectToRoute('app_trick_index', [], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/{slug}/add-specificity/{id}", name="app_trick_add_specificity", methods={"POST"})
     * @ParamConverter("slug", options={"mapping": {" slug " : "trick.slug"}})
     * @ParamConverter("id", options={"mapping": {" id " : "specificity.id"}})
     * @Template()
     */
    public function addSpecificity(Request $request, ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getManager();
        $trickId = $em->getRepository(Trick::class)->findBy(['slug' => $request->get('slug')])[0]->getId();
        $trick = $em->getRepository(Trick::class)->find($trickId);
        $specificity = $em->getRepository(Specificity::class)->find($request->get('id'));
        $specificity->addTrick($trick);
        $em->persist($specificity);
        $em->persist($trick);
        $em->flush();

        return $this->redirectToRoute('app_trick_edit', ['slug' => $request->get('slug')], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/{slug}/remove-specificity/{id}", name="app_trick_remove_specificity", methods={"POST"})
     * @ParamConverter("slug", options={"mapping": {" slug " : "trick.slug"}})
     * @ParamConverter("id", options={"mapping": {" id " : "specificity.id"}})
     * @Template()
     */
    public function removeSpecificity(Request $request, ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getManager();
        $trickId = $em->getRepository(Trick::class)->findBy(['slug' => $request->get('slug')])[0]->getId();
        $trick = $em->getRepository(Trick::class)->find($trickId);
        $specificity = $em->getRepository(Specificity::class)->find($request->get('id'));
        $specificity->removeTrick($trick);
        $em->persist($specificity);
        $em->flush();

        return $this->redirectToRoute('app_trick_edit', ['slug' => $request->get('slug')], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/{id}/comment/delete", name="app_trick_comment_delete", methods={"GET"})
     */
    public function deleteComment(Comment $comment, CommentRepository $commentRepository): Response
    {
        $commentRepository->remove($comment, true);

        return $this->redirectToRoute('app_trick_show', ['slug' => $comment->getTrick()->getSlug()], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/{id}/image/delete", name="app_trick_delete_image", methods={"DELETE"})
     */
    public function deleteImage(Image $image, Request $request, ManagerRegistry $doctrine): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        if ($this->isCsrfTokenValid('delete'.$image->getId(), $data['_token'])) {
            $name = $image->getName();
            unlink($this->getParameter('images_directory') . '/tricks/' . $name);

            $em = $doctrine->getManager();
            $em->remove($image);
            $em->flush();

            return new JsonResponse(['success' => 1]);
        } else {
            return new JsonResponse(['error' => 'Token invalide.'], 400);
        }
    }

    private function addImages($form, $trick, TrickRepository $trickRepository)
    {
        $trick->setCreationDate(new DateTime());
        $images = $form->get('images')->getData();

        foreach ($images as $image) {
            $file = uniqid() . '.' . $image->guessExtension ();
            $image->move(
                $this->getParameter('images_directory') . "/tricks/",
                $file
            );
            $img = new Image();
            $img->setName($file);
            $trick->addImage($img);
        }

        $trickRepository->add($trick, true);
    }

    private function isUnique($newTrickName, $tricksNames, $previousTrickName = null)
    {
        if (isset($previousTrickName)) {
            if ($newTrickName !== $previousTrickName) {
                $this->checkNamesUnicity($newTrickName, $tricksNames);
            }
        } else {
            $this->checkNamesUnicity($newTrickName, $tricksNames);
        }
    }

    private function checkNamesUnicity($newTrickName, $tricksNames) {
        foreach ($tricksNames as $trickName) {
            if (strtolower($trickName) === strtolower($newTrickName)) {
                throw $this->createNotFoundException('Le trick ' . $newTrickName . ' existe déjà.');
            }
        }
    }

    private function addVideo($trick, TrickRepository $trickRepository)
    {
        $trick->setVideo($trick->getVideo());
        $trickRepository->add($trick, true);
    }
}
