defmodule Friends.Repo.Migrations.CreatePostCommentTable do
  use Ecto.Migration

  def change do
    create table(:orgs, primary_key: false) do
      add :org_id, :bigserial, primary_key: true
      add :name, :string
      timestamps()
    end

    create table(:posts) do
      add :title, :string

      add :org_id,
          references(:orgs, column: :org_id),
          null: false

      timestamps()
    end

    create unique_index(:posts, [:id, :org_id])

    create table(:comments) do
      add :body, :string

      # There is no need to define a reference for org_id
      add :org_id, :integer, null: false

      # Instead define a composite foreign key
      add :post_id,
          references(:posts, with: [org_id: :org_id], match: :full),
          null: false

      timestamps()
    end

  end
end
