[<-- Back to main section](../README.md)

# Security

## API

Disable debug front controllers on staging and production servers:

```
API_AVAILABLE_FRONT_CONTROLLERS=index
API_DEBUG_FRONT_CONTROLLERS_ACCESS=off
```

~

Enable HTTP Basic Auth on non-production servers with the following value:

```
API_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.

## SPA

Enable HTTP Basic Auth on non-production servers with the following value:

```
SPA_HTTP_AUTH_BASIC=Restricted
```

Default credentials are `demo`/`demo`.

## phpMyAdmin

Set empty values to the following envs to make sure that 
phpMyAdmin will ask for the credentials to the database.

```
PHPMYADMIN_USER=
PHPMYADMIN_PASSWORD=
```
