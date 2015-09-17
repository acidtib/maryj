class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Maryj-Token, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
 
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Maryj-Token, Token'
      headers['Access-Control-Max-Age'] = '1728000'
 
      render :text => '', :content_type => 'text/plain'
    end
  end

  def pagination(collection)

    @pagination_response = {
      per_page: ::Kaminari.config.default_per_page,
      total_pages: collection.total_pages,
      total_objects: collection.total_count,
      links: pagination_links(collection)
    }

    return @pagination_response
  end

  def pagination_links(collection)
    current_uri = "#{env['API_DOMAIN'] || "http://api.maryj.dev"}"+request.env['PATH_INFO']
    meta_links = {}

    pages(collection).each do |key, value|
      query_params = request.query_parameters.merge(page: value)
      meta_links[key] = "#{current_uri}?#{query_params.to_param}"
    end

    meta_links
  end

  def pages(collection)
    {}.tap do |paging|
      paging[:first] = 1
      paging[:last] = collection.total_pages

      paging[:prev] = collection.current_page - 1 unless collection.first_page?
      paging[:next] = collection.current_page + 1 unless collection.last_page? or collection.current_page >= collection.total_pages
    end
  end
end
