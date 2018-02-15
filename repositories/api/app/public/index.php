<?php

/*
 * This is the main front controller.
 *
 * https://en.wikipedia.org/wiki/Front_controller
 */

$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

echo 'Hello world!<br>api / '.$_ENV['APP_VERSION'];
