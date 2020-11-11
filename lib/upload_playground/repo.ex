defmodule UploadPlayground.Repo do
  use Ecto.Repo,
    otp_app: :upload_playground,
    adapter: Ecto.Adapters.Postgres
end
