defmodule DelayBugWeb.Page do
  use DelayBugWeb, :live_view

  alias DelayBugWeb.{Tab1, Tab2, Tab3, Tab4}

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, :tab, :tab1)}
  end

  @impl true
  def handle_event("tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, :tab, String.to_atom(tab))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
    <ul>
    <li phx-click="tab" phx-value-tab="tab1">Tab 1</li>
    <li phx-click="tab" phx-value-tab="tab2">Tab 2</li>
    <li phx-click="tab" phx-value-tab="tab3">Tab 3</li>
    <li phx-click="tab" phx-value-tab="tab4">Tab 4</li>
    </ul>

    <%= if @tab == :tab1 do %>
    <.live_component id="tab1" module={Tab1} />
    <% end %>
    <%= if @tab == :tab2 do %>
    <.live_component id="tab2" module={Tab2} />
    <% end %>
    <%= if @tab == :tab3 do %>
    <.live_component id="tab3" module={Tab3} />
    <% end %>
    <%= if @tab == :tab4 do %>
    <.live_component id="tab4" module={Tab4} />
    <% end %>
    </div>
    """

    # ~H"""
    # <div>
    # <ul>
    # <li phx-click="tab" phx-value-tab="tab1">Tab 1</li>
    # <li phx-click="tab" phx-value-tab="tab2">Tab 2</li>
    # <li phx-click="tab" phx-value-tab="tab3">Tab 3</li>
    # <li phx-click="tab" phx-value-tab="tab4">Tab 4</li>
    # </ul>

    # <%= case @tab do %>
    # <% :tab1 -> %> <Tab1.render />
    # <% :tab2 -> %> <Tab2.render />
    # <% :tab3 -> %> <Tab3.render />
    # <% :tab4 -> %> <Tab4.render />
    # <% end %>
    # </div>
    # """

    # ~H"""
    # <div>
    # <ul>
    # <li phx-click="tab" phx-value-tab="tab1">Tab 1</li>
    # <li phx-click="tab" phx-value-tab="tab2">Tab 2</li>
    # <li phx-click="tab" phx-value-tab="tab3">Tab 3</li>
    # <li phx-click="tab" phx-value-tab="tab4">Tab 4</li>
    # </ul>

    # <%= case @tab do %>
    # <% :tab1 -> %> <%= live_render(@socket, Tab1, id: "tab1") %>
    # <% :tab2 -> %> <%= live_render(@socket, Tab2, id: "tab2") %>
    # <% :tab3 -> %> <%= live_render(@socket, Tab3, id: "tab3") %>
    # <% :tab4 -> %> <%= live_render(@socket, Tab4, id: "tab4") %>
    # <% end %>
    # </div>
    # """

    # ~H"""
    # <div>
    # <ul>
    # <li phx-click="tab" phx-value-tab="tab1">Tab 1</li>
    # <li phx-click="tab" phx-value-tab="tab2">Tab 2</li>
    # <li phx-click="tab" phx-value-tab="tab3">Tab 3</li>
    # <li phx-click="tab" phx-value-tab="tab4">Tab 4</li>
    # </ul>

    # <%= case @tab do %>
    # <% :tab1 -> %> <div>Tab 1</div>
    # <% :tab2 -> %> <div>Tab 2</div>
    # <% :tab3 -> %> <div>Tab 3</div>
    # <% :tab4 -> %> <div>Tab 4</div>
    # <% end %>
    # </div>
    # """
  end
end

defmodule DelayBugWeb.Tab1 do
  use DelayBugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
    Content of tab one
    <.live_component id="tab1-inner" module={DelayBugWeb.TabInner} tab="one" />
    </div>
    """
  end
end

defmodule DelayBugWeb.TabInner do
  use DelayBugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>Content of tab <%= @tab %> inner</div>
    """
  end
end

defmodule DelayBugWeb.Tab2 do
  use DelayBugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
    Content of tab two
    <.live_component id="tab2-inner" module={DelayBugWeb.TabInner} tab="two" />
    </div>
    """
  end
end

defmodule DelayBugWeb.Tab3 do
  use DelayBugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>Content of tab three</div>
    """
  end
end

defmodule DelayBugWeb.Tab4 do
  use DelayBugWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>Content of tab four</div>
    """
  end
end
