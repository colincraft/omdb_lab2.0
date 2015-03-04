$(document).ready(function () {

  // $("form") is jQuery's way of doing
  // document.getElementsByTagName("form). Listen to the "submit"
  // event. (This will listen for submit events on ALL the forms in
  // the page, but we only have one, so no big deal).
  $("form").on("submit", function (event) {
    console.log("Click has happened")

    // Prevent the page from reloading.
    event.preventDefault();

    var query = event.target.q.value;

    // Call the OMDB API. {s: query} passes the query term as the "s"
    // parameter to the API. The third argument is a function that is
    // called when the request is successful.
    $.getJSON("http://localhost:3000/movies", {s:query}, function (data) {
      var $results = $("#results").empty();
      if (data.Error) {
        $results.html("No results found.");
      } else {
        data.forEach(function (movie) {
          var li = $("<li></li>").text(movie.Title);
          $results.append(li);
        });
      }
    });
  });
});
