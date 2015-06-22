defmodule Issues.CLI do
  
  def run(argv) do
    parse_args(argv)
  end
  
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ],
                                      aliases: [ h: :help ])

    case parse do

      { [ help: true ], _, _ } -> :help

      { _, [ book, chapter, verse ], _ } -> { book, chapter, verse }

      _ -> :help

    end
  end

  def process(:help) do
    IO.puts """
      TOOL DESCRIPTION
      ================

      GoBible is a command line tool that fetches, parses, and displays passages
      from the Bible.

      USAGE
      =====

      GoBible takes three parameters: a book, a chapter, and a verse. As you may
      well expect, it then returns the content of the verse you requested.

      >> ./gobible "1 john", 1, 1
      "If we confess our sins, he is faithful and just to forgive us our sins,
      and to cleanse us from all unrighteousness. ~ 1 John 1:1"
    """

    System.halt(0)
  end

end
