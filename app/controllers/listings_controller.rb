class ListingsController < ApplicationController
  require 'rich_text_renderer'

  def index
    @component_name = 'listing index'
    @page_title = 'Available Properties'
    @listings = contentful.entries(content_type: 'property', include: 2)
  end

  def show
    @component_name = 'listing details'
    @renderer = RichTextRenderer::Renderer.new
    @entry = contentful.entry(params[:id], include: 2)
    @total_vacres = @entry.virtual_square_footage/43560.round

    @calculator_data = {
        total_sqft: @entry.virtual_square_footage,
        available_sqft: @entry.available_square_feet,
        price: @entry.price
    }
  end
end
