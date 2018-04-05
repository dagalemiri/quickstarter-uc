module ApplicationHelper

  def active_class(link_path)
  current_page?(link_path) ? "active" : ""
end

  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end

end
