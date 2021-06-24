class UrlsController < ApplicationController

  def index
    @urls = Url.all.order(created_at: :desc)
  end

  def new
    @url = Url.new
  end

  def create
    @url           = Url.new(url_params)
    @url.short_url = @url.make_short_url if @url.long_url.present?

    if @url.save
      redirect_to urls_path
    else
      redirect_to root_path
    end
  end

  def show
    url = Url.find_by_short_url(params[:token])
    if url.present?
      url.update(visit_count: url.visit_count + 1, ip_address: request.remote_ip)
      redirect_to url.long_url
    else
      redirect_to root_url, status: 404
    end
  end

  def info
    @url = Url.find_by_short_url(params[:token])
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end