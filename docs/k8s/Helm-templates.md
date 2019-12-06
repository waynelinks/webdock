# Helm templates

Base64 encoding

```
apiVersion: v1
kind: Secret
data:
  foo: {{ "bar" | b64enc | quote }}
```
