defmodule V8betApiWeb.ErrorJSONTest do
  use V8betApiWeb.ConnCase, async: true

  test "renders 404" do
    assert V8betApiWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert V8betApiWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
