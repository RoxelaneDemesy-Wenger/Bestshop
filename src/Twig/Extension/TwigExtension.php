<?php

namespace App\Twig\Extension;

use App\Twig\Runtime\TwigRuntime;
use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;
use Twig\TwigFunction;

class TwigExtension extends AbstractExtension
{
    public function getFilters(): array
    {
        return [
            // If your filter generates SAFE HTML, you should add a third
            // parameter: ['is_safe' => ['html']]
            // Reference: https://twig.symfony.com/doc/3.x/advanced.html#automatic-escaping
            new TwigFilter('filter_name', [TwigRuntime::class, 'doSomething']),
        ];
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('fullnamess', [TwigRuntime::class, 'test']),
        ];
    }


    public function test($prenom, $nom)
    {
        return ucfirst($prenom) . strtoupper($nom);
    }


}
