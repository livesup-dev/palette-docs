defmodule PaletteDocsWeb.Docs.InstallationLive.Index do
  use PaletteDocsWeb, :live_view
  alias Palette.Components.Breadcrumb.Step

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_defaults()
     |> assign_root_template()
     |> assign_app_template()
     |> view_helper_template()
     |> assign_mix_template()
     |> assign_containter_template()}
  end

  def assign_defaults(socket) do
    steps = [
      %Step{label: "Home", path: "/"},
      %Step{label: "Installation"}
    ]

    socket
    |> assign(:page_title, "Installation")
    |> assign(:section, :home)
    |> assign(:steps, steps)
  end

  def assign_root_template(socket) do
    code = """
    # components/layouts/root.html.leex
    <.html>
      <.head />
      <.body>
        <.preloader />
        <.page_wrapper>
          <%= @inner_content %>
        </.page_wrapper>
      </.body>
    </.html>
    """

    socket |> assign(:root_template, code)
  end

  def assign_app_template(socket) do
    code = """
    # components/layouts/app.html.leex
    <.live_component module={Palette.Components.Sidebar} id="sidebar">
      <.sidebar_main logo="/images/logo.png"></.sidebar_main>

      <.sidebar_panel>
        <.sidebar_panel :if={@section == :home} title="Home">
          <.sidebar_item label="Dashboard" path="/" />
        </.sidebar_panel>
        <.sidebar_panel :if={@section == :todo} title="Todo">
          <.sidebar_item label="My day" path="/" />
          <.sidebar_item label="Important" path="/" />
          <.sidebar_item label="Task" path="/" />
          <div class="my-4 mx-4 h-px bg-slate-200 dark:bg-navy-500"></div>
          <.sidebar_item label="Task" path="/" />
          <.sidebar_item label="Task" path="/" />
        </.sidebar_panel>
      </.sidebar_panel>
    </.live_component>

    <.app_header_wrapper>
      <.app_header search={false} />
    </.app_header_wrapper>

    <.main_content_wrapper>
      <%= @inner_content %>
    </.main_content_wrapper>

    """

    socket |> assign(:app_template, code)
  end

  def assign_containter_template(socket) do
    code = """
    def live_view do
      quote do
        use Phoenix.LiveView,
          layout: {PaletteDocsWeb.Layouts, :app},
          container: {:main, class: "main-content w-full px-[var(--margin-x)] pb-8"}

        unquote(html_helpers())
      end
    end
    """

    socket |> assign(:containter_template, code)
  end

  def view_helper_template(socket) do
    code = """
    def view_helpers do
      quote do
        ...
        use Palette
        ....
      end
    end
    """

    socket |> assign(:view_helper_template, code)
  end

  def assign_mix_template(socket) do
    code = """
    {:palette, git: "https://github.com/livesup-dev/palette", tag: "0.1.38"}
    """

    socket |> assign(:mix_template, code)
  end
end
