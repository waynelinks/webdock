<?php

/** @var string $version */
$version = $_ENV['APP_VERSION'] ?: 'undefined';
/** @var string $env */
$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
/** @var boolean $debug */
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

header('X-Version: '.$version);

echo 'Hello world!<br>web front controller / '.$version;
