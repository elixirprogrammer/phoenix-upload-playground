defmodule UploadPlayground.Repo.Migrations.CreateAvatars do
  use Ecto.Migration

  def change do
    create table(:avatars) do
      add :avatar, :string
      add :image, :string

      timestamps()
    end

  end
end
