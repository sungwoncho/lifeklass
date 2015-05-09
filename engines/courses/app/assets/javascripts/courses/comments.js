$(document).ready(function () {

  $('.reply-btn')
  .on('click', function (e) {
    e.preventDefault();

    var me        = $(this),
        parentId  = me.data('parent-id'),
        replyForm = $("#comment_" + parentId).find('.reply-form');

        replyForm.slideToggle(500);
  });

  $('.edit-btn')
  .on('click', function (e) {
    e.preventDefault();

    var me = $(this),
        editForm = $(this).closest('.comment').find('.edit-form')

        editForm.slideToggle(500);
  });

});
