defmodule Vize.Native do
  use Rustler, otp_app: :vize, crate: "vize_ex_nif"

  @spec parse_sfc_nif(String.t()) :: {:ok, map()} | {:error, String.t()}
  def parse_sfc_nif(_source), do: :erlang.nif_error(:nif_not_loaded)

  @spec compile_sfc_nif(String.t(), boolean(), boolean()) :: {:ok, map()} | {:error, String.t()}
  def compile_sfc_nif(_source, _vapor, _ssr), do: :erlang.nif_error(:nif_not_loaded)

  @spec compile_template_nif(String.t(), String.t(), boolean()) ::
          {:ok, map()} | {:error, list()}
  def compile_template_nif(_source, _mode, _ssr), do: :erlang.nif_error(:nif_not_loaded)

  @spec compile_ssr_nif(String.t()) :: {:ok, map()} | {:error, list()}
  def compile_ssr_nif(_source), do: :erlang.nif_error(:nif_not_loaded)

  @spec compile_vapor_nif(String.t(), boolean()) :: {:ok, map()} | {:error, list()}
  def compile_vapor_nif(_source, _ssr), do: :erlang.nif_error(:nif_not_loaded)

  @spec vapor_ir_nif(String.t()) :: {:ok, map()} | {:error, list()}
  def vapor_ir_nif(_source), do: :erlang.nif_error(:nif_not_loaded)

  @spec lint_nif(String.t(), String.t()) :: {:ok, list()}
  def lint_nif(_source, _filename), do: :erlang.nif_error(:nif_not_loaded)
end
