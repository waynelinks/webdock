[<-- Back to main section](../README.md)

# Security

## Backend

Disable debug front controllers on staging and production servers.

```
BACKEND_AVAILABLE_FRONT_CONTROLLERS=index
BACKEND_DEBUG_FRONT_CONTROLLERS_ACCESS=off
```

## phpMyAdmin

Set empty values to the following envs to make sure that 
phpMyAdmin will ask for credentials.

```
PMA_USER=
PMA_PASSWORD=
```
