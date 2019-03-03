defmodule PhoneDictonary do
  @moduledoc """
  Provides a function `dictonary_words/1` to convert phone number into words from the dictionary
  """
  # Constant map for phone number keywords
  @phone_map %{
    "0" => [],
    "1" => [],
    "2" => ["A", "B", "C"],
    "3" => ["D", "E", "F"],
    "4" => ["G", "H", "I"],
    "5" => ["J", "K", "L"],
    "6" => ["M", "N", "O"],
    "7" => ["P", "Q", "R", "S"],
    "8" => ["T", "U", "V"],
    "9" => ["W", "X", "Y", "Z"]
  }

  @doc """
  Returns list of list of words from dictonary.
  ## Parameters

    - phone_number: String that represents the name 10 digit phone number.


  ## Examples

  iex(20)> PhoneDictonary.dictonary_words("7782668687")
  [[["PST", "AMOUNTS"]], [["PST", "CONTOUR"]]]

  iex(21)> PhoneDictonary.dictonary_words("6686787825")
  [[["MOTOR", "TRUCK"]], [["MOTOR", "USUAL"]],
  [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]], [["NOUNS", "USUAL"]],
  [["ONTO", "STRUCK"]]]

  """

  def dictonary_words(phone_number) when is_binary(phone_number) do
    # Read the dictonary.txt and get as map
    dict_map =
      Task.async(fn ->
        case File.read("lib/dictionary.txt") do
          {:ok, dictonary} ->
            {:read_success, dictonary}

            dictonary
            |> String.split("\n")
            |> to_map(%{})

          {:error, _} ->
            :read_failed
        end
      end)
      |> Task.await()

    phone_number = String.reverse(phone_number)

    combine_words(String.length(phone_number), String.split(phone_number, "", trim: true), [])
    |> Enum.map(fn x -> substring_sets(x, dict_map) end)
    |> Enum.filter(fn x -> x != [] end)
  end

  @doc """
   Returns the message if phone number is not in string quotes
  """
  def dictonary_words(phone_number) when is_binary(phone_number) == false,
    do: "Please provide a 10 digit phone number in string quotes"

  @doc """
   Returns the message if phone number is blank
  """
  def dictonary_words(), do: "Please provide a 10 digit phone number in string quotes"

  @doc """
   Method for creating sets of substring of words
  """
  def substring_sets(str, dict_map), do: words_sets(3, str, [], dict_map)

  @doc """
   Method for getting sets two words from the given dictionary min length of the word will be 3 And maximum length would be 7
  """
  def words_sets(len, str, word_groups, dict_map) when len <= 7 do
    {word1, word2} = String.split_at(str, len - 1)

    if(Map.get(dict_map, word1) != nil and Map.get(dict_map, word2) != nil) do
      word_groups = word_groups ++ [[word1, word2]]
    end

    words_sets(len + 1, str, word_groups, dict_map)
  end

  def words_sets(_, _, word_groups, _) do
    word_groups
  end

  @doc """
   Accumulate the list of strings into a list of words
  """
  def combine_words(n, [h | t], acc) when n >= 0 do
    combine_words(n - 1, t, add_prefix(Map.get(@phone_map, h), "", acc))
  end

  @doc """
   Returns accumulated list of strings into a list of words if prefix list is empty
  """
  def combine_words(0, [], acc) do
    acc
  end

  @doc """
  Converts the given list of string char into words
  """
  def add_prefix(list, _, acc) when acc != [] do
    # A comprehension with two List of strings
    for x <- list, y <- acc, do: x <> y
  end

  @doc """
  Returns the given list of string chars if accumulator is empty
  """
  def add_prefix(list, _, []), do: list

  @doc """
  Returns the list of words if list of string chars is empty
  """
  def add_prefix([], _, acc), do: acc

  @doc """
  Converts the given list into the map
  """
  def to_map([h | t], acc), do: to_map(t, Map.put(acc, h, h))

  @doc """
  Returns the map if list is empty
  """
  def to_map([], acc), do: acc
end
