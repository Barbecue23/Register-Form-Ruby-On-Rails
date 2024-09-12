module ApplicationHelper
  def sort_link(title, column)
    direction = (column == params[:sort_by] && params[:direction] == 'asc') ? 'desc' : 'asc'
    link_to title, root_path(sort_by: column, direction: direction)
  end
end
