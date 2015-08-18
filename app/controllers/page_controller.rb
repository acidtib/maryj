class PageController < ApplicationController
  def home
  end

  def dev
    @category = Category.find_by_name('Sativa')
    @sativa = Strain.where(category_id: @category)

    #@response = @sativa.map do |sativa|
    #    {
    #      symbol: sativa.symbol,
    #      name: sativa.name
    #    }
    #  end

    render json: @sativa
  end
end
