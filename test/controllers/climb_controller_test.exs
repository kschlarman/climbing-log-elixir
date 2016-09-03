defmodule ClimbingLog.ClimbControllerTest do
  use ClimbingLog.ConnCase

  alias ClimbingLog.Climb
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, grade: "some content", location: "some content", name: "some content", notes: "some content", type: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, climb_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    climb = Repo.insert! %Climb{}
    conn = get conn, climb_path(conn, :show, climb)
    assert json_response(conn, 200)["data"] == %{"id" => climb.id,
      "name" => climb.name,
      "grade" => climb.grade,
      "type" => climb.type,
      "location" => climb.location,
      "date" => climb.date,
      "notes" => climb.notes}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, climb_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, climb_path(conn, :create), climb: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Climb, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, climb_path(conn, :create), climb: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    climb = Repo.insert! %Climb{}
    conn = put conn, climb_path(conn, :update, climb), climb: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Climb, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    climb = Repo.insert! %Climb{}
    conn = put conn, climb_path(conn, :update, climb), climb: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    climb = Repo.insert! %Climb{}
    conn = delete conn, climb_path(conn, :delete, climb)
    assert response(conn, 204)
    refute Repo.get(Climb, climb.id)
  end
end
