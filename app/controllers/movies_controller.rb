class MoviesController < ApplicationController
  def index
    
    
    puts "This has been submitted #{params["s"]}"
    request = Typhoeus::Request.new(
      "http://www.omdbapi.com/?",
      method: :get,
      params: {s: "#{params["s"]}"}
      )
    request.run
    puts "body of the response is #{request.response.body}"
    @my_movies_hash = JSON.parse(request.response.body)
    puts @my_movies_hash
    respond_to do |format|
        format.html # render .erb template as normal
        format.json {render :json => @my_movies_hash}
    end
  end
end
