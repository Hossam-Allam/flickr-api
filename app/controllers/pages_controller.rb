class PagesController < ApplicationController
  def index
    if params[:user_id].present?
      flickr = Flickr.new(
        api_key: ENV["FLICKR_API_KEY"],
        shared_secret: ENV["FLICKR_SHARED_SECRET"]
      )

      @photos = flickr.photos.search(user_id: params[:user_id])
    end
  rescue => e
    flash.now[:error] = "Error fetching photos: #{e.message}"
    @photos = []
  end
end
