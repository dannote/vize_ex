# Vize

Elixir bindings for the [Vize](https://vizejs.dev) Vue.js toolchain via Rust NIFs.

Compile, lint, and analyze Vue Single File Components at native speed —
including Vapor mode IR for BEAM-native SSR.

## Features

- **Compile** Vue SFCs to JavaScript + CSS (DOM, Vapor, SSR modes)
- **Template** compilation — standalone template → render function
- **Vapor IR** — get the intermediate representation as Elixir maps for BEAM-native rendering
- **SSR** — server-side rendering compilation with `_push()` codegen
- **Lint** Vue SFCs with built-in rules

## Installation

```elixir
def deps do
  [
    {:vize, "~> 0.1.0"}
  ]
end
```

Requires a Rust toolchain (`rustup` recommended). The NIF compiles automatically on `mix compile`.

## Usage

### Compile SFC

```elixir
{:ok, result} = Vize.compile_sfc("""
<template>
  <button @click="count++">{{ count }}</button>
</template>

<script setup>
import { ref } from 'vue'
const count = ref(0)
</script>

<style scoped>
button { color: blue; }
</style>
""")

result.code     # Generated JavaScript
result.css      # Compiled CSS
result.errors   # []
```

### Vapor Mode

```elixir
{:ok, result} = Vize.compile_vapor("<div>{{ msg }}</div>")
result.code       # Vapor JS (no virtual DOM)
result.templates  # Static HTML templates
```

### Vapor IR (for BEAM-native SSR)

```elixir
{:ok, ir} = Vize.vapor_ir("<div :class=\"cls\">{{ msg }}</div>")

ir.templates   # ["<div></div>"]
ir.block       # %{operations: [...], effects: [...], returns: [...]}
```

The IR exposes every operation (set_prop, set_text, if_node, for_node,
create_component, etc.) as plain Elixir maps — enabling a pure Elixir
renderer that produces HTML without executing JavaScript.

### SSR Compilation

```elixir
{:ok, result} = Vize.compile_ssr("<div>{{ msg }}</div>")
result.code      # JS with _push() calls
result.preamble  # Import statements
```

### Template Compilation

```elixir
{:ok, result} = Vize.compile_template("<div v-if=\"show\">{{ msg }}</div>")
result.code     # Render function
result.helpers  # ["createElementVNode", "toDisplayString", ...]
```

### Lint

```elixir
{:ok, diagnostics} = Vize.lint("<template><img></template>", "App.vue")
```

### Parse SFC

```elixir
{:ok, descriptor} = Vize.parse_sfc(source)
descriptor.template      # %{content: "...", lang: nil, ...}
descriptor.script_setup  # %{content: "...", setup: true, ...}
descriptor.styles        # [%{content: "...", scoped: true, ...}]
```

## License

[MIT](./LICENSE)
