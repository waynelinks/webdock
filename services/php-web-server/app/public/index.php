<?php

$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

echo 'Hello world!<br>api\'s web front controller / '.$_ENV['APP_VERSION'];
