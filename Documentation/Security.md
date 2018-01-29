[<-- Back to main section](../README.md)

# Security

## API

Disable debug front controllers on staging and production servers:

```
APP_AVAILABLE_FRONT_CONTROLLERS=index
APP_DEBUG_FRONT_CONTROLLERS_ACCESS=off
```

~

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.

#### phpMyAdmin

Set empty values to the following envs to make sure that 
phpMyAdmin will ask for the credentials to the database.

```
PHPMYADMIN_USER=
PHPMYADMIN_PASSWORD=
```

## SPA

Enable HTTP Basic Auth on non-production servers with the following value:

```
APP_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.
