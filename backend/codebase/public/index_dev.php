<?php

/*
 * This check prevents access to debug front controllers that are deployed by accident to production servers.
 */
if (empty($_ENV['BACKEND_DEBUG_FRONT_CONTROLLERS_ACCESS']) || 'on' !== $_ENV['BACKEND_DEBUG_FRONT_CONTROLLERS_ACCESS']) {
    header('HTTP/1.0 403 Forbidden');
    exit('You are not allowed to access this file. Check '.basename(__FILE__).' for more information.');
}

phpinfo();
