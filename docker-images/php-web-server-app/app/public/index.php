<?php

require_once __DIR__.'/../vendor/autoload.php';

/** @var string $env */
$env = $_ENV['APP_ENV'] ?? 'production';
/** @var string $version */
$version = $_ENV['VERSION'] ?? 'undefined';

error_log('App logs some stuff.');

header('Content-Type: application/json');
echo json_encode([
    'message' => 'Hello world!',
]);
