<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitType;
use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/produit')]
class ProduitController extends AbstractController
{
    #[Route('/all', name: 'app_all_products', methods: ['GET'])]
    public function index(ProduitRepository $produitRepository): Response
    {
        return $this->render('produit/products.html.twig', [
            'produits' => $produitRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_new_product', methods: ['GET', 'POST'])]
    public function new(Request $request, ProduitRepository $produitRepository): Response
    {
        $produit = new Produit();
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $produitRepository->save($produit, true);

            return $this->redirectToRoute('produit/products.html.twig', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('produit/new_product.html.twig', [
            'produit' => $produit,
            'formProduit' => $form->createView()
        ]);
    }

    #[Route('/{id<\d+>}', name: 'app_product', methods: ['GET'])]
    public function show(Produit $produit): Response
    {
        return $this->render('produit/view_product.html.twig', [
            'produit' => $produit,
        ]);
    }

    #[Route('/update_{id<\d+>}', name: 'app_update_product', methods: ['GET', 'POST'])]
    public function edit(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $produitRepository->save($produit, true);

            return $this->redirectToRoute('app_all_products', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('produit/new_product.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
        //fichier edit = update
    }

    #[Route('/delete_{id<\d+>}', name: 'app_delete_product', methods: ['POST'])]
    public function delete(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $produitRepository->remove($produit, true);
        }

        return $this->redirectToRoute('app_all_products', [], Response::HTTP_SEE_OTHER);
    }
}
