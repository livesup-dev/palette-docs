defmodule PaletteWeb.Components.SyntaxHighlighter do
  use Phoenix.Component
  import Phoenix.HTML

  attr :code, :string, default: nil

  def syntax_highlight(assigns) do
    ~H"""
    <div class="mb-4 border">
      <%= raw(highlight(@code)) %>
    </div>
    """
  end

  defp highlight(code) do
    Makeup.highlight(code)
  end

  def syntax_highlight_css do
    Makeup.Styles.HTML.StyleMap.default_style()
    |> Makeup.stylesheet()
  end
end
