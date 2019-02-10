#!/usr/bin/env php
<?php

set_time_limit(0);

require_once __DIR__.'/../vendor/autoload.php';

/** @var string $version */
$version = $_ENV['WEBSERVER_VERSION'] ?: 'undefined';
/** @var string $env */
$env = $_ENV['WEBSERVER_ENVIRONMENT'] ?: 'prod';

/*
 * Some log
 */
$logger = new \Monolog\Logger('main');
$handler = new \Monolog\Handler\StreamHandler('php://stderr');
$formatter = new \Monolog\Formatter\JsonFormatter();

$handler->setFormatter($formatter);
$logger->pushHandler($handler);

$logger->info('CLI front controller logging stuff.', ['env' => $env]);

/*
 * Some output
 */
echo 'Hello world!'.PHP_EOL.'cli front controller / '.$version.PHP_EOL;

/*
 * Simulates heavy process
 */
sleep(15);
