$(document).ready(function() {

  $('.post').on('click', '.delete', function() {
    event.preventDefault();
    var url = $(this).attr('href');
    var id = url.slice(7);
    $.ajax({
      url: url,
      method: 'DELETE',
      data: $(this).serialize()
    })
    .done(function(res) {
      $('.post.' + id).css({ display: 'none' });
      $('.post.' + id).html(res)
    });
  });

  $('.comment-on-answer').on("click",function(event){
    event.preventDefault();
    var newcommentURL = $(this).attr('href')

    $.get(newcommentURL, function(response){
      $('#answer').append(response)
    });
  });

  $('#all-post-display').on("submit", "#upvote-question-form", function(event){
    event.preventDefault()
    var total_post_votes = $(this).siblings("#total-post-votes")
    $.ajax({
      url: $(this).attr("action"),
      method: "post",
      data: $(this).serialize()
    }).done(function(response){
      total_post_votes.html(response.total_votes)
    })
  })

  $('#all-post-display').on("submit", "#downvote-question-form", function(event){
    event.preventDefault()
    var total_post_votes = $(this).siblings("#total-post-votes")
    $.ajax({
      url: $(this).attr("action"),
      method: "post",
      data: $(this).serialize()
    }).done(function(response){
      total_post_votes.html(response.total_votes)
    })
  })

  $(".post-deets").on("submit", "#upvote-question-form", function(event){
    event.preventDefault()
    var total_answer_votes = $(this).parent().siblings("#total-votes-answer").children()
    $.ajax({
      url: $(this).attr("action"),
      method: "post",
      data: $(this).serialize()
    }).done(function(response){
      console.log(response)
      var string = "total votes " + response.total_votes
      total_answer_votes.html(string)
    })
  })

  $(".post-deets").on("submit", "#downvote-question-form", function(event){
    event.preventDefault()
    var total_answer_votes = $(this).parent().siblings("#total-votes-answer").children()
    $.ajax({
      url: $(this).attr("action"),
      method: "post",
      data: $(this).serialize()
    }).done(function(response){
      console.log(response)
      var string = "total votes " + response.total_votes
      total_answer_votes.html(string)
    })
  })
});
