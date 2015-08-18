class PageController < ApplicationController
  def home
  end

  def dev
    @category = Category.all
    @strain = Strain.where(category_id: @category)

    @response = @strain.map do |strain|
      {
        symbol: strain.symbol,
        name: strain.name,
        slug: strain.slug
      }
    end

    render json: @response
  end
end
