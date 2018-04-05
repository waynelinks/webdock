#!/usr/bin/env php
<?php

set_time_limit(0);

/** @var string $env */
$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
/** @var boolean $debug */
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

echo 'Hello world!'.PHP_EOL.'cli front controller / '.$_ENV['APP_VERSION'].PHP_EOL;
