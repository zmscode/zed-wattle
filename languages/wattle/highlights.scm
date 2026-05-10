; ─────────────── keywords ───────────────
[
  "fn"
  "let"
  "var"
  "const"
  "return"
  "if"
  "then"
  "else"
  "match"
  "for"
  "while"
  "break"
  "continue"
  "import"
  "as"
  "with"
  "defer"
  "errdefer"
  "try"
  "catch"
  "orelse"
  "struct"
  "enum"
  "union"
  "interface"
  "type"
  "error"
  "test"
  "and"
  "or"
  "not"
] @keyword

[
  "true"
  "false"
  "null"
] @constant.builtin

; ─────────────── operators & punctuation ───────────────
[
  "+" "-" "*" "/" "%" "**"
  "==" "!=" "<" "<=" ">" ">="
  "<<" ">>" "&" "|" "^" "~"
  "=" "+=" "-=" "*=" "/=" "%=" "**=" "<<=" ">>=" "&=" "|=" "^="
  ".." "..="
  "=>"
  "!"
  "?"
] @operator

[
  ";" "," "." ":"
] @punctuation.delimiter

[
  "(" ")"
  "[" "]"
  "{" "}"
  "<" ">"
  "|"
] @punctuation.bracket

; ─────────────── comments ───────────────
(line_comment)  @comment
(block_comment) @comment

; ─────────────── literals ───────────────
(integer_literal)     @number
(float_literal)       @number.float
(boolean_literal)     @constant.builtin
(null_literal)        @constant.builtin
(unreachable_literal) @keyword.exception

(string_literal)  @string
(cstr_literal)    @string.special
(bytes_literal)   @string.special
(char_literal)    @character
(escape_sequence) @string.escape

; error literal: error.NotFound
(error_literal
  "error" @keyword
  "." @punctuation.delimiter
  (identifier) @constant)

; ─────────────── types ───────────────
(builtin_type) @type.builtin

; CapitalIdentifier as type
((identifier) @type
  (#match? @type "^[A-Z]"))

(generic_type
  (identifier) @type)

(field_decl
  type: (_) @type)

(parameter
  type: (_) @type)

(fn_decl
  return_type: (_) @type)

(const_decl
  type: (_) @type)

(let_decl
  type: (_) @type)

(var_decl
  type: (_) @type)

; ─────────────── declarations ───────────────
(fn_decl
  name: (identifier) @function)

(extern_fn_decl
  name: (identifier) @function)

(parameter
  name: (identifier) @variable.parameter)

(const_decl
  name: (identifier) @constant)

(let_decl
  name: (identifier) @variable)

(var_decl
  name: (identifier) @variable)

(field_decl
  name: (identifier) @property)

(enum_variant
  name: (identifier) @constant)

(struct_field_init
  name: (identifier) @property)

(test_decl
  "test" @keyword
  name: (string_literal) @string.special)

; ─────────────── intrinsics & globals — # sigil ───────────────
(intrinsic
  "#"  @punctuation.special
  name: (identifier) @function.builtin)

(intrinsic_type
  "#"  @punctuation.special
  (identifier) @type.builtin)

; uppercase intrinsic ident → constant
((intrinsic
   name: (identifier) @constant.builtin)
  (#match? @constant.builtin "^[A-Z_]+$"))

; lowercase short intrinsic ident → constant (e.g. #pi #tau #e)
((intrinsic
   name: (identifier) @constant.builtin)
  (#match? @constant.builtin "^(pi|tau|e|phi|inf|nan|epsilon)$"))

; ─────────────── enum patterns / variants ───────────────
(enum_pattern
  "." @punctuation.delimiter
  (identifier) @constant)

(enum_literal
  "." @punctuation.delimiter
  (identifier) @constant)

; ─────────────── calls ───────────────
(call_expression
  callee: (identifier) @function.call)

(call_expression
  callee: (field_access
    (identifier) @function.call .))

; ─────────────── imports ───────────────
(import_decl
  path: (string_literal) @string.special.path
  alias: (identifier)? @namespace)

(import_symbol
  (identifier) @variable.import)

; ─────────────── foreign-language blocks ───────────────
(foreign_block
  "#" @punctuation.special
  lang: (foreign_lang) @attribute)

; ─────────────── modifiers ───────────────
(visibility) @keyword.modifier
(extern_kw)  @keyword.modifier
(export_kw)  @keyword.modifier
(comptime_kw) @keyword.modifier
(global_kw)   @keyword.modifier
(packed_kw)   @keyword.modifier
(aligned_kw)  @keyword.modifier

; ─────────────── identifiers fallback ───────────────
(identifier) @variable
