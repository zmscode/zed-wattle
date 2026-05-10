(fn_decl
  (visibility)? @context
  "fn" @context
  name: (_) @name) @item

(struct_decl
  (visibility)? @context
  "struct" @context
  name: (_) @name) @item

(union_decl
  (visibility)? @context
  "union" @context
  name: (_) @name) @item

(enum_decl
  (visibility)? @context
  "enum" @context
  name: (_) @name) @item

(interface_decl
  (visibility)? @context
  "interface" @context
  name: (_) @name) @item

(error_decl
  (visibility)? @context
  "error" @context
  name: (_) @name) @item

(type_decl
  (visibility)? @context
  "type" @context
  name: (_) @name) @item

(const_decl
  "const" @context
  name: (_) @name) @item

(test_decl
  "test" @context
  name: (_) @name) @item
