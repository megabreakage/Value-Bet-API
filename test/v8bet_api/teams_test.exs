defmodule V8betApi.TeamsTest do
  use V8betApi.DataCase

  alias V8betApi.Teams

  describe "teams" do
    alias V8betApi.Teams.Team

    import V8betApi.TeamsFixtures

    @invalid_attrs %{active: nil, biography: nil, deleted_at: nil, name: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{
        active: true,
        biography: "some biography",
        deleted_at: ~U[2024-04-17 11:22:00Z],
        name: "some name"
      }

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.active == true
      assert team.biography == "some biography"
      assert team.deleted_at == ~U[2024-04-17 11:22:00Z]
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()

      update_attrs = %{
        active: false,
        biography: "some updated biography",
        deleted_at: ~U[2024-04-18 11:22:00Z],
        name: "some updated name"
      }

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.active == false
      assert team.biography == "some updated biography"
      assert team.deleted_at == ~U[2024-04-18 11:22:00Z]
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end
end
