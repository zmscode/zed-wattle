; Inject foreign languages into #lang { ... } blocks
; so the body is highlighted by that language's grammar
; (when the editor has it installed).

((foreign_block
  lang: (foreign_lang) @lang
  (foreign_body) @content)
 (#set! injection.language @lang)
 (#set! injection.combined))
