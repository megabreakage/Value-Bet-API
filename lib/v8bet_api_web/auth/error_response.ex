defmodule V8betApi.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule V8betApi.Auth.ErrorResponse.AssignRoleFailed do
  defexception message: "Unauthorized", plug_status: 403
end

defmodule V8betApi.Auth.ErrorResponse.CreateFailed do
  defexception message: "CreateFailed", plug_status: 404
end
