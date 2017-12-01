<?php

/*
 * This check prevents access to debug front controllers that are deployed by accident to production servers.
 */
if (!isset($_ENV['API_DEBUG_FRONT_CONTROLLERS_ACCESS']) || 'on' !== $_ENV['API_DEBUG_FRONT_CONTROLLERS_ACCESS']) {
    header('HTTP/1.0 403 Forbidden');
    exit('You are not allowed to access this file. Check '.basename(__FILE__).' for more information.');
}

phpinfo();
