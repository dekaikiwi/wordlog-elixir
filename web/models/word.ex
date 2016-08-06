defmodule WordlogElixer.Word do
  use WordlogElixer.Web, :model
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "words" do
    field      :word_string
    has_many   :translations, WordlogElixer.Translation
    timestamps
  end

  @required_fields ~w(word_string)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
