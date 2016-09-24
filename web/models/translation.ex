defmodule WordlogElixer.Translation do
  use WordlogElixer.Web, :model
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "translations" do
    field :word_id, :integer
    field :translation_string
    #belongs_to :word, WordlogElixer.Word

    timestamps
  end

  @required_fields ~w(translation_string locale)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
