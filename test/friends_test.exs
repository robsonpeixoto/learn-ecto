defmodule FriendsTest do
  use Friends.RepoCase
  doctest Friends

  test "greets the world" do
    assert Friends.hello() == :world
  end
end
