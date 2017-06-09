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
    $('.comment-on-answer').hide()

    $.get(newcommentURL, function(response){
      $('#answer').append(response)
    });
  });

  $('.post-deets').on("click",".submit-comment",function(event){
    event.preventDefault();

    $.ajax({
      url: $(this).closest('form').attr('action'),
      method: 'post',
      data: $(this).closest('form').serialize()
    })
    .done(function(response) {
      $('.comment-on-answer').show()
      $('#comment-form').hide()
      $('#comment').append(response)
    });

  });


});
