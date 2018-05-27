defmodule TestingTest do
  use ExUnit.Case
  doctest Testing

  test "stufF" do
    {:ok, pid} = Testing.start_link()
    :erlang.trace(pid, true, [:receive])

    assert_receive({:trace, ^pid, :receive, :work}, 11000)
    assert_receive({:trace, ^pid, :receive, :work}, 11000)

    :erlang.trace(pid, false, [:receive])
  end

end
