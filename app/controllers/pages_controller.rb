class PagesController < ApplicationController
  def index
    @component_name = 'listing'
    @page_title = 'Available Properties'
  end
end
