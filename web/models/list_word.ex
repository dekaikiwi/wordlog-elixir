defmodule WordlogElixer.ListWord do
  use WordlogElixer.Web, :model
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "lists_words" do
    field :list_id, :integer
    field :word_id, :integer

    timestamps
  end

  @required_fields ~w(word_id list_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
