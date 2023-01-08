<?php

namespace App\Controller\Admin;

use App\Entity\Image;
use App\Entity\Specificity;
use App\Form\SpecificityType;
use App\Repository\SpecificityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/specificity")
 * @IsGranted("ROLE_EDITOR")
 */
class SpecificityController extends AbstractController
{
    /**
     * @Route("/", name="app_specificity_index", methods={"GET"})
     */
    public function index(SpecificityRepository $specificityRepository): Response
    {
        return $this->render('specificity/index.html.twig', [
            'specificities' => $specificityRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="app_specificity_new", methods={"GET", "POST"})
     */
    public function new(Request $request, SpecificityRepository $specificityRepository): Response
    {
        $specificity = new Specificity();
        $form = $this->createForm(SpecificityType::class, $specificity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->addImages($form, $specificity, $specificityRepository);

            return $this->redirectToRoute('app_specificity_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('specificity/new.html.twig', [
            'specificity' => $specificity,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_specificity_show", methods={"GET"})
     */
    public function show(Specificity $specificity): Response
    {
        return $this->render('specificity/show.html.twig', [
            'specificity' => $specificity,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="app_specificity_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Specificity $specificity, SpecificityRepository $specificityRepository): Response
    {
        $form = $this->createForm(SpecificityType::class, $specificity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->addImages($form, $specificity, $specificityRepository);

            $specificityRepository->add($specificity, true);

            return $this->redirectToRoute('app_specificity_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('specificity/edit.html.twig', [
            'specificity' => $specificity,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_specificity_delete", methods={"POST"})
     */
    public function delete(Request $request, Specificity $specificity, SpecificityRepository $specificityRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$specificity->getId(), $request->request->get('_token'))) {
            $icon = $specificity->getIcon();
            unlink($this->getParameter('images_directory') . "/icons/" . $icon);
            $specificityRepository->remove($specificity, true);
        }

        return $this->redirectToRoute('app_specificity_index', [], Response::HTTP_SEE_OTHER);
    }

    private function addImages($form, $specificity, SpecificityRepository $specificityRepository)
    {
        $image = $form->get('icon')->getData();
        $file = uniqid() . '.' . $image->guessExtension ();
        $image->move(
            $this->getParameter('images_directory') . "/icons/",
            $file
        );
        $img = new Image();
        $img->setName($file);
        $specificity->setIcon($img->getName());

        $specificityRepository->add($specificity, true);
    }
}
