<?php

namespace App\Form;

use App\Entity\Marque;
use App\Entity\Produit;
use App\Filter\ProduitFilter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class FilterProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('marques', EntityType::class, [
                'class' => Marque::class,
                'choice_label' => 'nom',
                "multiple" => true,
                "expanded" => true,
                "required" => true

            ])
          
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => ProduitFilter::class,
        ]);
    }
}
