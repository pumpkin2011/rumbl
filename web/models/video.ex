defmodule Rumbl.Video do
  use Rumbl.Web, :model

  @require_fields ~w(url title description)
  @optional_fiels ~w(category_id)
  @primary_key {:id, Rumbl.Permalink, autogenerate: true}

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category
    has_many :annotations, Rumbl.Annotation

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description, :category_id])
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
  end

  defimpl Phoenix.Param, for: Rumbl.Video do
    def to_param(%{id: id}) do
      "#{id}-hello"
    end
  end

end
