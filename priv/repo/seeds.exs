# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WordlogElixer.Repo.insert!(%WordlogElixer.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias WordlogElixer.Repo

wordTranslationRegex = ~r/(.\s.*\s)\/(.*)\//u # Regular Expression to split word from translations from edict

edictStream = File.stream!('priv/repo/edict_utf8', [:read])

Enum.each edictStream, fn x ->

  result = Regex.run(wordTranslationRegex, x)

  if result != nil do
    #IO.puts List.last(result)
  else
    IO.puts x
  end

end
