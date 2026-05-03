# Changelog

## 0.10.0

- Bump upstream Vize crates 0.43 → 0.76
- Add `:custom_renderer` option to `compile_sfc/2` — treats lowercase non-HTML tags as renderer-native elements instead of Vue components
- Add `:strip_types` option to `compile_sfc/2` — strips TypeScript type annotations via OXC, returning plain JavaScript in a single NIF call
- `compile_sfc/2` result now includes `:macro_artifacts` — compile-time macro artifacts extracted from script blocks (`definePage`, `definePageMeta`, etc.)
- Add `generate_dts/2` — generates `.d.ts` declarations from SFC script analysis
- Fix `:end_` atom → `:end` in loc maps and macro artifacts

## 0.9.0

- Bump upstream Vize crates 0.28 → 0.43
- Rewrite `vapor_split` Rust module for correctness

## 0.8.0

- Add `bundle_css/2` — bundle a CSS file and all its `@import` dependencies into a single stylesheet via LightningCSS's Bundler. Reads files from disk, resolves imports recursively, wraps in `@media`/`@supports`/`@layer` as needed.

## 0.7.0

- Add `css_modules: true` option to `compile_css/2` — enables LightningCSS CSS Modules mode. Class names, IDs, keyframes, and custom identifiers are scoped, result includes `:exports` map of original → hashed names.

## 0.6.0

- Add `vapor_split/1` — compiles a Vue template into a statics/slots split ready for `%Phoenix.LiveView.Rendered{}`. All HTML manipulation (tag tree parsing, element-to-tag mapping, marker injection, splitting) happens in the NIF. Sub-blocks for `v-if` / `v-for` / `v-else` are recursively split.

## 0.5.0

- Precompiled NIF binaries via `RustlerPrecompiled` (aarch64-apple-darwin, x86_64-apple-darwin, aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, x86_64-unknown-linux-musl)

## 0.4.0

- Add `compile_css/2` — standalone LightningCSS pipeline with autoprefixing, minification, browser targeting, and Vue scoped styles

## 0.3.0

- Accept `filename` and `scope_id` options in `compile_sfc/2`
- Return `template_hash`, `style_hash`, `script_hash` for HMR change detection
- Encode `key_prop` for `v-for` `:key` attribute in Vapor IR

## 0.2.0

- Expose `is_static` flag and `element_template_map` in Vapor IR
- Encode directive expressions (`v-show`, `v-model`) in Vapor IR

## 0.1.0

- Initial release
- `compile_sfc/1` — compile Vue SFCs to JavaScript + CSS
- `compile_template/1` — standalone template compilation
- `compile_vapor/1` — Vapor mode compilation
- `compile_ssr/1` — SSR compilation
- `vapor_ir/1` — Vapor IR as Elixir maps
- `parse_sfc/1` — parse SFC descriptor
- `lint/2` — lint Vue SFCs
