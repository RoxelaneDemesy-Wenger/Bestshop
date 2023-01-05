<?php

namespace App\Form;

use App\Entity\Marque;
use App\Entity\Produit;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('marque', EntityType::class, [
                'placeholder' => 'Choisissez une marque:',
                'class' => Marque::class,
                'choice_label' => 'nom'
            ])
            ->add('modele')
            ->add('couleur')
            ->add('taille')
            ->add('prix')
            ->add('photo', FileType::class,
            [
               "mapped" => false,
               "required" => false,
            ])
            ->add('photo', FileType::class,
            [
               "mapped" => false,
               "required" => false,
            ])
            ->add('photo', FileType::class,
            [
               "mapped" => false,
               "required" => false,
            ])
            ->add('memoire')
            ->add('description')
            ->add('envoyer', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produit::class,
        ]);
    }
}
