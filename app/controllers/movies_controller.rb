class MoviesController < ApplicationController
  def index
  end

  def new
  end

  def show

  end

  def submit
    puts "This has been submitted #{params["q"]}"
    request = Typhoeus::Request.new(
      "http://www.omdbapi.com/?",
      method: :get,
      params: {s: "#{params["q"]}"}
      )
    request.run
    # puts "body of the response is #{request.response.body}"
    @my_movies_hash = JSON.parse(request.response.body)
    # puts @my_movies_hash
  end

  def show

  end
  def edit
  end

  def delete
  end
end
