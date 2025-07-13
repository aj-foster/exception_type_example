defmodule ExceptionTypeExample do
  @moduledoc """
  Documentation for `ExceptionTypeExample`.
  """
  defexception [:message, :other]

  @impl Exception
  def exception(binary_or_keyword)

  def exception(message) when is_binary(message) do
    exception(message: message, other: :other)
  end

  def exception(attributes) when is_list(attributes) do
    attributes = Keyword.put(attributes, :other, :other)
    struct!(__MODULE__, attributes)
  end
end
