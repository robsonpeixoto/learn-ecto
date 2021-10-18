defmodule Friends.Person do
  use Ecto.Schema

  schema "people" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:age, :integer)
  end

  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :age])
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
  end

  def insert_person(name) do
    params = %{first_name: name, last_name: "bililiu", age: 0}
    %__MODULE__{}
    |> __MODULE__.changeset(params)
    |> Friends.Repo.insert()
  end
end
