defmodule LiveviewChatExample.Repo do
  use Ecto.Repo,
    otp_app: :liveview_chat_example,
    adapter: Ecto.Adapters.Postgres
end
