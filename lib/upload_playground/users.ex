defmodule UploadPlayground.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias UploadPlayground.Repo

  alias UploadPlayground.Users.Avatar

  @doc """
  Returns the list of avatars.

  ## Examples

      iex> list_avatars()
      [%Avatar{}, ...]

  """
  def list_avatars do
    Repo.all(Avatar)
  end

  @doc """
  Gets a single avatar.

  Raises `Ecto.NoResultsError` if the Avatar does not exist.

  ## Examples

      iex> get_avatar!(123)
      %Avatar{}

      iex> get_avatar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_avatar!(id), do: Repo.get!(Avatar, id)

  @doc """
  Creates a avatar.

  ## Examples

      iex> create_avatar(%{field: value})
      {:ok, %Avatar{}}

      iex> create_avatar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_avatar(attrs \\ %{}) do
    %Avatar{}
    |> Avatar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a avatar.

  ## Examples

      iex> update_avatar(avatar, %{field: new_value})
      {:ok, %Avatar{}}

      iex> update_avatar(avatar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_avatar(%Avatar{} = avatar, attrs) do
    avatar
    |> Avatar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a avatar.

  ## Examples

      iex> delete_avatar(avatar)
      {:ok, %Avatar{}}

      iex> delete_avatar(avatar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_avatar(%Avatar{} = avatar) do
    Repo.delete(avatar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking avatar changes.

  ## Examples

      iex> change_avatar(avatar)
      %Ecto.Changeset{data: %Avatar{}}

  """
  def change_avatar(%Avatar{} = avatar, attrs \\ %{}) do
    Avatar.changeset(avatar, attrs)
  end

  def create_user_avatar(attrs \\ %{}) do
    %Avatar{}
    |> Avatar.avatar_changeset(attrs)
    |> Repo.insert()
  end

  def change_user_avatar(%Avatar{} = user) do
    Avatar.avatar_changeset(user, %{})
  end
end
