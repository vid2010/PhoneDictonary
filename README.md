#  PhoneDictonary problem solution
This project will convert the given 10 digit phone number into the list of words.
## Description
Given a 10 digit phone number, you must return all possible words or combination of words from the provided dictionary, that can be mapped back as a whole to the number.
- With this we can generate numbers like 1-800-motortruck which is easier to remember then 1-800-6686787825.
- The phone numbers will never contain a 0 or 1.
- Words have to be at least 3 characters.
- The conversion of a 10 digit phone number should be performed within 1000ms.
- The phone number mapping to letters is as follows:
```
2 = a b c
3 = d e f
4 = g h i
5 = j k l
6 = m n o
7 = p q r s
8 = t u v
9 = w x y z
```
## Test cases
To get give you an initial verification, the following must be true:
- 6686787825 should return the following list [["MOTOR", "TRUCK"]], [["MOTOR", "USUAL"]], [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]], [["NOUNS", "USUAL"]],
 [["ONTO", "STRUCK"]]]
- 2282668687 should return the following list [[["ACT", "AMOUNTS"], ["ACTA", "MOUNTS"]], [["ACT", "CONTOUR"]],
 [["BAT", "AMOUNTS"]], [["BAT", "CONTOUR"]], [["CAT", "AMOUNTS"]],
 [["CAT", "CONTOUR"]]]

## Problem thought process
- Convert csv `dictonary.text` file to key value map.
  * e.g %{"HELLO" => "HELLO", "TEST" => "TEST", "TRUCK" => "TRUCK"}
- Get the phone number and generate the list of possible combinations of words from given phone number mapping.
- Create the list all possible combinations of group of two words in which min length of the word should be 3 and maximum 7.
- Map the given list of gropu two words from dictonary map.
- Filter the empty lists from the results.
## Elixir version
[Elixir-1.5.2](https://elixir-lang.org/blog/2017/07/25/elixir-v1-5-0-released/)
## Dependencies
- Configured the compatible dependency for elixir(1.5.2) html docs is bellow.
  * `{:ex_doc, "~> 0.18.0"}`
- Run the `mix deps.get` cmd on console, this will download and configured the dependency.
- Run the `mix deps.compile` cmd on console, this will compile all the dependencies.
## Code execution steps
- Clone or download project and go into the project folder in command line console.
- Type `iex -S mix` and hit enter this will open iex session for running the code.
- Run the function by giving input phone number as below.
  * PhoneDictonary.dictonary_words("6686787825")
  * Output will be [["MOTOR", "TRUCK"]], [["MOTOR", "USUAL"]], [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]], [["NOUNS", "USUAL"]], [["ONTO", "STRUCK"]]]
## Html documents
- Html documents for code can be generate by `mix docs` command.
- Generated documents will be available on this `doc/index.html` path
## Performance benchmarks
Below are the performance benchmark for the code execution for 10 digit phone number in milli seconds.

| Input        | Output           | Time  |
| ------------- |:-------------:| -----:|
| `2282668687`| `[[["ACT", "AMOUNTS"], ["ACTA", "MOUNTS"]], [["ACT", "CONTOUR"]], [["BAT", "AMOUNTS"]], [["BAT", "CONTOUR"]], [["CAT", "AMOUNTS"]], [["CAT", "CONTOUR"]]]`| `715` |
| `6686787825`|`[[["MOTOR", "TRUCK"]], [["MOTOR", "USUAL"]], [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]], [["NOUNS", "USUAL"]], [["ONTO", "STRUCK"]]]`| `833`|


## Installation
If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `phone_dictonary` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phone_dictonary, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/phone_dictonary](https://hexdocs.pm/phone_dictonary).
