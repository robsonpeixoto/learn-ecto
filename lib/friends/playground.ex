defmodule Friends.Playground do
  @moduledoc "Just a place to write queries"

  require Ecto.Query, as: Query

  def avg_from_top_10_oldest do
    inner_query =
      Query.from(p in Friends.Person,
        order_by: [desc: :age],
        limit: 10,
        select: %{age: p.age}
      )

    query =
      Query.from(q in Query.subquery(inner_query),
        select: avg(q.age)
      )

    Friends.Repo.one(query)
  end

  def fail_multi do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:totonho, fn _, _ ->
      Friends.Person.insert_person("totonho")
    end)
    |> Ecto.Multi.run(:tofail, fn _, %{totonho: %{id: id}} ->
      {:error, id}
    end)
    |> Friends.Repo.transaction()
  end
end
