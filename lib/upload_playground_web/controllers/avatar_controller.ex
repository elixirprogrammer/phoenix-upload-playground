defmodule UploadPlaygroundWeb.AvatarController do
  use UploadPlaygroundWeb, :controller

  alias UploadPlayground.Users
  alias UploadPlayground.Users.Avatar

  def index(conn, _params) do
    avatars = Users.list_avatars()
    render(conn, "index.html", avatars: avatars)
  end

  def new(conn, _params) do
    changeset = Users.change_avatar(%Avatar{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"avatar" => avatar_params}) do
    case Users.create_avatar(avatar_params) do
      {:ok, avatar} ->
        conn
        |> put_flash(:info, "Avatar created successfully.")
        |> redirect(to: Routes.avatar_path(conn, :show, avatar))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    avatar = Users.get_avatar!(id)
    render(conn, "show.html", avatar: avatar)
  end

  def edit(conn, %{"id" => id}) do
    avatar = Users.get_avatar!(id)
    changeset = Users.change_avatar(avatar)
    render(conn, "edit.html", avatar: avatar, changeset: changeset)
  end

  def update(conn, %{"id" => id, "avatar" => avatar_params}) do
    avatar = Users.get_avatar!(id)

    case Users.update_avatar(avatar, avatar_params) do
      {:ok, avatar} ->
        conn
        |> put_flash(:info, "Avatar updated successfully.")
        |> redirect(to: Routes.avatar_path(conn, :show, avatar))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", avatar: avatar, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    avatar = Users.get_avatar!(id)
    {:ok, _avatar} = Users.delete_avatar(avatar)

    conn
    |> put_flash(:info, "Avatar deleted successfully.")
    |> redirect(to: Routes.avatar_path(conn, :index))
  end

  def create_avatar(conn, %{"avatar" => avatar_params}) do
    IO.inspect(avatar_params)
    case Users.create_user_avatar(avatar_params) do
      {:ok, _avatar} ->
        conn
        |> put_flash(:info, "Avatar updated successfully.")
        |> redirect(to: Routes.avatar_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", avatar_changeset: changeset)
    end
  end

  def upload(conn, %{"avatar_id" => id}) do
    avatar = Users.get_avatar!(id)
    conn
    |> put_resp_content_type("image/jpeg")
    |> send_file(200, "uploads/#{avatar.avatar.file_name}")
  end
end
