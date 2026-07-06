; extends

; Go template actions ({{ ... }}) embedded in gohtmltmpl files. Only fires
; when the node actually contains a template delimiter, so plain .html
; buffers are unaffected.
((text) @injection.content
  (#contains? @injection.content "{{")
  (#set! injection.language "gotmpl"))

((quoted_attribute_value
  (attribute_value) @injection.content)
  (#contains? @injection.content "{{")
  (#set! injection.language "gotmpl"))

((comment) @injection.content
  (#contains? @injection.content "{{")
  (#set! injection.language "gotmpl"))
