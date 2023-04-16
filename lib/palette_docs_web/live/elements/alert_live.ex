defmodule PaletteDocsWeb.Elements.AlertLive do
  use PaletteDocsWeb, :live_view
  alias Palette.Components.Breadcrumb.Step

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_defaults()}
  end

  def assign_defaults(socket) do
    steps = [
      %Step{label: "Home", path: "/"},
      %Step{label: "Elements", path: "/elements/alert"},
      %Step{label: "Alert"}
    ]

    socket
    |> assign(:page_title, "Alert")
    |> assign(:section, :elements)
    |> assign(:steps, steps)
  end
end
