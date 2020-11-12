defmodule UploadPlayground.UsersTest do
  use UploadPlayground.DataCase

  alias UploadPlayground.Users

  describe "avatars" do
    alias UploadPlayground.Users.Avatar

    @valid_attrs %{avatar: "some avatar", image: "some image"}
    @update_attrs %{avatar: "some updated avatar", image: "some updated image"}
    @invalid_attrs %{avatar: nil, image: nil}

    def avatar_fixture(attrs \\ %{}) do
      {:ok, avatar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_avatar()

      avatar
    end

    test "list_avatars/0 returns all avatars" do
      avatar = avatar_fixture()
      assert Users.list_avatars() == [avatar]
    end

    test "get_avatar!/1 returns the avatar with given id" do
      avatar = avatar_fixture()
      assert Users.get_avatar!(avatar.id) == avatar
    end

    test "create_avatar/1 with valid data creates a avatar" do
      assert {:ok, %Avatar{} = avatar} = Users.create_avatar(@valid_attrs)
      assert avatar.avatar == "some avatar"
      assert avatar.image == "some image"
    end

    test "create_avatar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_avatar(@invalid_attrs)
    end

    test "update_avatar/2 with valid data updates the avatar" do
      avatar = avatar_fixture()
      assert {:ok, %Avatar{} = avatar} = Users.update_avatar(avatar, @update_attrs)
      assert avatar.avatar == "some updated avatar"
      assert avatar.image == "some updated image"
    end

    test "update_avatar/2 with invalid data returns error changeset" do
      avatar = avatar_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_avatar(avatar, @invalid_attrs)
      assert avatar == Users.get_avatar!(avatar.id)
    end

    test "delete_avatar/1 deletes the avatar" do
      avatar = avatar_fixture()
      assert {:ok, %Avatar{}} = Users.delete_avatar(avatar)
      assert_raise Ecto.NoResultsError, fn -> Users.get_avatar!(avatar.id) end
    end

    test "change_avatar/1 returns a avatar changeset" do
      avatar = avatar_fixture()
      assert %Ecto.Changeset{} = Users.change_avatar(avatar)
    end
  end
end
