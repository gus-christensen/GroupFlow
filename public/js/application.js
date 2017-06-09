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



});
