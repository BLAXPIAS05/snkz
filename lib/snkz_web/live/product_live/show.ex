defmodule SnkzWeb.ProductLive.Show do
  use SnkzWeb, :live_view

  alias Snkz.Products

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    product = Products.get_product!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, product)
     |> assign(:current_image, List.first(product.images))}
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:sell), do: "Sell Product"
  defp page_title(:edit), do: "Edit Product"
end
