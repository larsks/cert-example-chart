{{- define "cert-example.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "cert-example.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "cert-example.labels" -}}
{{ include "cert-example.selectorLabels" . }}
{{- end }}

{{- define "cert-example.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cert-example.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
