{{- define "the-web-cloud-platform.metaLabels" -}}
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
{{- end }}
{{ include "the-web-cloud-platform.matchLabels" $ }}
{{- end -}}

{{- define "the-web-cloud-platform.matchLabels" -}}
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/part-of: "{{ .Chart.Name }}"
app.kubernetes.io/name: "the-web-cloud-app"
{{- end -}}
