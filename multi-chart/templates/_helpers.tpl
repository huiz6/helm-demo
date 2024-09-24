{{- define "multi-chart.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "multi-chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "multi-chart.labels" -}}
app.kubernetes.io/name: {{ include "multi-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "multi-chart.selectorLabels" -}}
app: {{ include "multi-chart.name" . }}
{{- end -}}

{{- define "multi-chart.deploymentLabels" -}}
{{ include "multi-chart.selectorLabels" . }}
{{ include "multi-chart.labels" . }}
{{- end -}}