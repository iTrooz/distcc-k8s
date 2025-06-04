{{/* Generate a fullname for resources */}}
{{- define "distcc.fullname" -}}
{{- printf "%s-distcc" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
