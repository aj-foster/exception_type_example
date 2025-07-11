defmodule ExceptionTypeExample do
  @moduledoc """
  Documentation for `ExceptionTypeExample`.
  """

  defexception [:message, :other]

  @impl true
  def exception(message) do
    super(message: message, other: :other)
  end
end
