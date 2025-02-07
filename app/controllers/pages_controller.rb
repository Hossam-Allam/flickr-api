class PagesController < ApplicationController
  def index
    Rails.logger.debug "Flickr API Key: #{ENV['FLICKR_API_KEY']}"

    if params[:user_id].present?
      flickr = Flickr.new(
        ENV["FLICKR_API_KEY"],
        ENV["FLICKR_SHARED_SECRET"]
      )

      @photos = flickr.photos.search(user_id: params[:user_id])
    end
  rescue => e
    flash.now[:error] = "Error fetching photos: #{e.message}"
    @photos = []
  end
end
