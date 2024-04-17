defmodule V8betApi.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end
