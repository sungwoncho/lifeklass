# crumb :root do
#   link "Home", main_app.root_path
# end

crumb :course do |course|
  link course.title, courses_app.course_path(course)
end

crumb :menu do |menu|
  link menu.name, courses_app.course_menu_path(menu.course, menu)
  parent :course, menu.course
end

crumb :content do |content|
  link content.title, courses_app.course_menu_content_path(content.menu.course, content.menu, content)
  parent :menu, content.menu
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
