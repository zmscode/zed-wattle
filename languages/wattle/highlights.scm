; Mirror of tree-sitter-wattle/queries/highlights.scm so the Zed extension
; can ship a working set even before the grammar repo is published.
; Keep in sync with tree-sitter-wattle/queries/highlights.scm.

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
  "pub"
  "global"
  "extern"
  "export"
  "comptime"
  "defer"
  "errdefer"
  "try"
  "catch"
  "orelse"
  "unreachable"
  "struct"
  "enum"
  "union"
  "interface"
  "type"
  "error"
  "test"
  "packed"
  "aligned"
  "and"
  "or"
  "not"
  "in"
  "self"
  "Self"
] @keyword

[
  "true"
  "false"
  "null"
] @constant.builtin

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

[ ";" "," "." ":" ] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" "<" ">" "|" ] @punctuation.bracket

(line_comment)  @comment
(block_comment) @comment

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

(error_literal
  "error" @keyword
  "." @punctuation.delimiter
  (identifier) @constant)

(builtin_type) @type.builtin

((identifier) @type
  (#match? @type "^[A-Z]"))

(generic_type (identifier) @type)
(field_decl   type: (_) @type)
(parameter    type: (_) @type)
(fn_decl      return_type: (_) @type)
(const_decl   type: (_) @type)
(let_decl     type: (_) @type)
(var_decl     type: (_) @type)

(fn_decl        name: (identifier) @function)
(extern_fn_decl name: (identifier) @function)
(parameter      name: (identifier) @variable.parameter)
(const_decl     name: (identifier) @constant)
(let_decl       name: (identifier) @variable)
(var_decl       name: (identifier) @variable)
(field_decl     name: (identifier) @property)
(enum_variant   name: (identifier) @constant)
(struct_field_init name: (identifier) @property)

(test_decl
  name: (string_literal) @string.special
  "test" @keyword)

(intrinsic
  "#"  @punctuation.special
  name: (identifier) @function.builtin)

(intrinsic_type
  "#"  @punctuation.special
  (identifier) @type.builtin)

((intrinsic name: (identifier) @constant.builtin)
  (#match? @constant.builtin "^[A-Z_]+$"))

((intrinsic name: (identifier) @constant.builtin)
  (#match? @constant.builtin "^(pi|tau|e|phi|inf|nan|epsilon)$"))

(enum_pattern  "." @punctuation.delimiter (identifier) @constant)
(enum_literal  "." @punctuation.delimiter (identifier) @constant)

(call_expression callee: (identifier) @function)
(call_expression callee: (field_access (identifier) @function .))

(import_decl
  path: (string_literal) @string.special
  alias: (identifier)? @type)

(import_symbol (identifier) @variable)

(foreign_block
  "#" @punctuation.special
  lang: (foreign_lang) @attribute)

(visibility)  @keyword
(extern_kw)   @keyword
(export_kw)   @keyword
(comptime_kw) @keyword
(global_kw)   @keyword
(packed_kw)   @keyword
(aligned_kw)  @keyword

(identifier) @variable
