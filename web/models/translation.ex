defmodule WordlogElixer.Translation do
  use WordlogElixer.Web, :model
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "translations" do
    field :translation_string
    field :locale

    belongs_to :word, WordlogElixer.Word

    timestamps
  end

  @required_fields ~w(word_id translation_string locale)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
