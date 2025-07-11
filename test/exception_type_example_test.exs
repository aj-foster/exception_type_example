defmodule ExceptionTypeExampleTest do
  use ExUnit.Case
  doctest ExceptionTypeExample

  test "greets the world" do
    assert ExceptionTypeExample.hello() == :world
  end
end
