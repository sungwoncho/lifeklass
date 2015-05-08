module Courses
  module ContentsHelper
    def nested_comments(comments)
      comments.map do |comment, replies|
        render('courses/comments/comment', comment: comment) +
         (replies.present? ? content_tag(:div, nested_comments(replies), class: 'reply') : nil)
      end.join.html_safe
    end
  end
end
