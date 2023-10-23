defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  import Ecto.Query, only: [from: 2]
  alias Takso.Sales.Taxi
  alias Takso.Repo

  def new(conn, _params) do
    render conn, "new.html"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
    query = from t in Taxi, where: t.status == "available", select: t

    available_taxis = Repo.all(query)
    if length(available_taxis)!=0 do
      conn
      |> put_flash(:info, "Your taxi will arrive in 15 minutes")
      |> redirect(to: "/bookings")
    else
      conn
      |> put_flash(:error, "All taxi drivers are busy. At present, there is no taxi available!")
      |> redirect(to: "/bookings/new")
    end
  end
end
