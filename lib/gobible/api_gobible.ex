defmodule Gobible.APIGobible do
  
  def fetch({ book, chapter, verse }) do
    url = gobible_url(book, chapter, verse)
    
    HTTPoison.get(url)
    |> handle_response
  end

  def gobible_url(book, chapter, verse) do
    "https://getbible.net/json?text=#{book}#{chapter}:#{verse}"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    { :ok, body }
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: _, body: body}}) do
    { :error, body } # JSX.decode(body)
  end

  def handle_response({:ok, %HTTPoison.Error{id: _, reason: reason}}) do
    { :error, reason }
  end

end
