defmodule UploadPlayground.Users.Avatar do
  use Ecto.Schema
  import Ecto.Changeset
  use Waffle.Ecto.Schema

  schema "avatars" do
    field :avatar, UploadPlayground.AvatarUploader.Type
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(avatar, attrs) do
    avatar
    |> cast(attrs, [:avatar, :image])
    |> validate_required([:avatar, :image])
  end

  def avatar_changeset(avatar, attrs) do
    avatar
    |> cast(attrs, [:image])
    |> cast_attachments(attrs, [:avatar])
  end
end
