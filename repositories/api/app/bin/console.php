#!/usr/bin/env php
<?php

$env = $_ENV['APP_ENVIRONMENT'] ?: 'prod';
$debug = ($_ENV['APP_DEBUG'] ?: 'off') === 'on' && $env !== 'prod';

set_time_limit(0);

echo 'Hello world!'.PHP_EOL.'api\'s cli front controller / '.$_ENV['APP_VERSION'].PHP_EOL;
