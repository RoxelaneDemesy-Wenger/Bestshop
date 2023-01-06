<?php

// https://sharemycode.fr/userCheck

namespace App\Security;

use App\Entity\User as AppUser;
use Symfony\Component\Security\Core\Exception\AccountExpiredException;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAccountStatusException;
use Symfony\Component\Security\Core\User\UserCheckerInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class UserChecker implements UserCheckerInterface
{
    public function checkPreAuth(UserInterface $user): void
    {
        if (!$user instanceof AppUser) {
            return;
        }

        if($user->isIsValid() !== true )
        {
            throw new CustomUserMessageAccountStatusException('votre compte n\'est pas activé, veuillez verifier vos emails !');
        }

        // if ($user->isDeleted()) {
          // the message passed to this exception is meant to be displayed to the user
        //     throw new CustomUserMessageAccountStatusException('Your user account no longer exists.');
        // }
    }

    public function checkPostAuth(UserInterface $user): void
    {
        if (!$user instanceof AppUser) {
            return;
        }

        // user account is expired, the user may be notified
        // if ($user->isExpired()) {
        //     throw new AccountExpiredException('...');
        // }
    }
}