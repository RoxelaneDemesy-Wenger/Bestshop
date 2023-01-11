<?php

namespace App\Controller;

use LogicException;
use App\Form\AdminType;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    #[Route(path: '/login', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        $this->addFlash("success", "Bienvenue, vous êtes connecté(e)");
        
        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
        
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        $this->addFlash("error", "Vous êtes déconnecté(e)");
        
        throw new LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }

    #[Route(path: '/passerAdmin_{id<\d+>}', name: 'app_passer_admin')]
    public function passerAdmin($id, Request $request, UserRepository $repo){
        
        $secret = "123123aA";

        $form = $this->createForm(AdminType::class);
        $form->handleRequest($request);

        $user = $repo->find($id);
        //avec le repo/Repository => récupère moi ce user avec cet id

        if(!$user){
            throw $this->createNotFoundException("Immpossible de trouver l'utilisateur avec l'id : $id");
        }

        if($form->isSubmitted() && $form->isValid()){

                if($form->get('secret')->getData()== $secret){
                    $user->setRoles(["ROLE_ADMIN"]);
                }else{
                    throw $this->createNotFoundException("Vous n'avez pas le bon code, veuillez contacter l'administrateur");
                }

            $repo->save($user,1);

            $this->addFlash("success", "Félicitation votre compte est maintenant un compte ADMIN.");

            return $this->redirectToRoute('app_home');
        }

        $this->addFlash("error", "Merci de remplir ce champs ou de contacter votre administrateur.");

        return $this->render('security/adminForm.html.twig', [
            "user" => $user,
            "formAdmin" => $form->createView()
        ]);
    }

    #[Route(path: '/confirmationCompte/{token}', name: 'app_confirmation_token')]
    public function confirmationCompte($token,UserRepository $repo){

    //récupère l'utilisateur ayant le token de l'url

    $user = $repo->findOneBy(["token" => $token]);

    //on vérifie si un utilisateur est trouvé

    if(!$user){

        $this->addFlash("error", "Aucun utilisateur trouvé");

        return $this->redirectToRoute('app_login');
    }

    //le token existe est donc l'utilisateur à été vérifié (trouvé dans la db) On enlève le token et on "active" son compte
    $user->setToken(null)
         ->setIsValid(true);

    $repo->save($user, 1);

    $this->addFlash("success", "Félicitation votre compte est bien activé! Bienvenue, connectez-vous.");

    return $this->redirectToRoute('app_login');

    }
}
