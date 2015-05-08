var loaded = function () {
  $(document).on('click', '.reply-btn', function (e) {
    e.preventDefault();

    var me        = $(this),
        parentId  = me.data('parent-id'),
        replyForm = $("#comment_" + parentId).find('.reply-form');

        replyForm.slideToggle(500);
  });
}

$(document).on('page:load ready', loaded);
