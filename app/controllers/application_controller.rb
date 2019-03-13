class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def contentful
    @client ||= Contentful::Client.new(
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        space: ENV['CONTENTFUL_SPACE_ID'],
        dynamic_entries: :auto,
        raise_errors: false,
        raise_for_empty_fields: false
    )
  end
end
