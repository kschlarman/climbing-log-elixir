defmodule ClimbingLog.ClimbController do
  use ClimbingLog.Web, :controller

  alias ClimbingLog.Climb

  def index(conn, _params) do
    climbs = Repo.all(Climb)
    render(conn, "index.json", climbs: climbs)
  end

  def create(conn, %{"climb" => climb_params}) do
    changeset = Climb.changeset(%Climb{}, climb_params)

    case Repo.insert(changeset) do
      {:ok, climb} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", climb_path(conn, :show, climb))
        |> render("show.json", climb: climb)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ClimbingLog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    climb = Repo.get!(Climb, id)
    render(conn, "show.json", climb: climb)
  end

  def update(conn, %{"id" => id, "climb" => climb_params}) do
    climb = Repo.get!(Climb, id)
    changeset = Climb.changeset(climb, climb_params)

    case Repo.update(changeset) do
      {:ok, climb} ->
        render(conn, "show.json", climb: climb)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ClimbingLog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    climb = Repo.get!(Climb, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(climb)

    send_resp(conn, :no_content, "")
  end
end
