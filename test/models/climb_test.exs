defmodule ClimbingLog.ClimbTest do
  use ClimbingLog.ModelCase

  alias ClimbingLog.Climb

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, grade: "some content", location: "some content", name: "some content", notes: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Climb.changeset(%Climb{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Climb.changeset(%Climb{}, @invalid_attrs)
    refute changeset.valid?
  end
end
