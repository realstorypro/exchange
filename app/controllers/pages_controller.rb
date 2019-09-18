class PagesController < ApplicationController
  layout 'page'

  def index
    @page_title = 'Available Properties'
  end
end
