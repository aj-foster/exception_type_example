# Exception Type Example

This PR is a reduced test case demonstrating a dialyzer warning related to Elixir's core Exception behaviour.

When overriding `exception/1` in a custom `defexception` module, calls to `super` can create dialyzer warnings if not all clauses of the overridden method are used.

Specifically, this test cases produces the following warning on `defexception`:

```
The guard test:

is_binary(_ :: [{atom(), _}, ...])

can never succeed.
```

(run `mix dialyzer` for type checking)

The offending code:

```elixir
defmodule ExceptionTypeExample do
  @moduledoc """
  Documentation for `ExceptionTypeExample`.
  """

  defexception [:message, :other]

  @impl true
  def exception(binary_or_keyword)

  def exception(message) when is_binary(message) do
    super(message: message, other: :other)
  end

  def exception(attributes) when is_list(attributes) do
    attributes = Keyword.put(attributes, :other, :other)
    super(attributes)
  end
end
```

## Environment

Tested on:

```
Erlang/OTP 28 [erts-16.0.1] [source] [64-bit] [smp:14:14] [ds:14:14:10] [async-threads:1] [jit]

Elixir 1.18.4 (compiled with Erlang/OTP 28)
```
