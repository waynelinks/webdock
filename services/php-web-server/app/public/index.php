<?php

/** @var string $env */
$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
/** @var boolean $debug */
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

echo 'Hello world!<br>web front controller / '.$_ENV['APP_VERSION'];
