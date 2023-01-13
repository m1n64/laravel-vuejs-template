<?php

namespace App\Helpers;

use App\Contracts\HelperInterface;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Cookie\CookieJar;
use Symfony\Component\HttpFoundation\Cookie;

class CookiesHelper implements HelperInterface
{
    /**
     * @param string $name
     * @param string|null $value
     * @return CookieJar|Cookie|Application
     */
    public static function setCookie(string $name, string|null $value = null): CookieJar|Cookie|Application
    {
        return \cookie($name, $value, httpOnly: false);
    }
}
