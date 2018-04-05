$(document).on('turbolinks:load', function () {
  var $comments;
  if (($comments = $('#section-comments')).length) {
    $comments.on('ajax:success', function (e, data) {
      // var commentsCounter = $('.comments-list').length;
      if (data.comment_id) {
          var $comment;
          $comment = $('.comments-list li [data-comment-id="' + data.comment_id + '"]');
          $comment.closest('li').remove();
          // commentsCounter--;
          // console.log(commentsCounter);
          //
          // if(commentsCounter===0 ){
          //   console.log('vacio!');
          //   $('.comments-list').remove();
          //   $('.comments-container').append('<div class="project-header" id="no-comments"> <p> There are no comments<p> </div>');
          // }

      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
});
