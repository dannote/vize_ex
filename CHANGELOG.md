# Changelog

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
