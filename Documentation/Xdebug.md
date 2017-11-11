[<-- Back to main section](../README.md)

# Xdebug

https://xdebug.org/

Xdebug is not installed in the backend image by default. 
To do it run `make backend.install-xdebug`.
This is required after each container recreation.

## PHPStorm

![PHPStorm Xdebug port config](assets/phpstorm-xdebug-port-config.png)

![PHPStorm Xdebug run config](assets/phpstorm-xdebug-run-config.png)

## Chrome

![Chrome Xdebug helper](assets/chrome-xdebug-helper.png)

https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc

## KCacheGrind

https://kcachegrind.github.io/html/Home.html

##### Linux/Ubuntu

`sudo apt install kcachegrind`
 
##### MacOS

`brew install qcachegrind`

##### Windows

https://sourceforge.net/projects/qcachegrindwin/
