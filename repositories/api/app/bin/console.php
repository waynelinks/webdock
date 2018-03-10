#!/usr/bin/env php
<?php

/*
 * This is the main cli front controller
 * https://en.wikipedia.org/wiki/Front_controller
 */

$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

set_time_limit(0);

echo 'Hello world!'.PHP_EOL.'api / '.$_ENV['APP_VERSION'].PHP_EOL;
