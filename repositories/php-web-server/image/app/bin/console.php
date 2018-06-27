#!/usr/bin/env php
<?php

set_time_limit(0);

/** @var string $version */
$version = $_ENV['APP_VERSION'] ?: 'undefined';
/** @var string $env */
$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
/** @var boolean $debug */
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

echo 'Hello world!'.PHP_EOL.'cli front controller / '.$version.PHP_EOL;
sleep(15); // simulates heavy process
