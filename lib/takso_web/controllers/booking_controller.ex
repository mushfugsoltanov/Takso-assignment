defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  def new(conn, _params ) do
    render conn, "new.html"
  end

  def index(conn, _params ) do
    render conn, "index.html"
  end  

  def create(conn, _params) do
    conn
        |> put_flash(:info, "Your taxi will arrive in 20 minutes")
        |> redirect(to: "/bookings")
  end
end