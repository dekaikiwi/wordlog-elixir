defmodule WordlogElixer.List do
  use WordlogElixer.Web, :model
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "lists" do
    field :name
    field :description
    field :type

    many_to_many :words, WordlogElixer.Word, join_through: "lists_words"

    #TODO: Store User ID when user management is implemented
    #field :user_id

    timestamps
  end

  @required_fields ~w(name type)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
