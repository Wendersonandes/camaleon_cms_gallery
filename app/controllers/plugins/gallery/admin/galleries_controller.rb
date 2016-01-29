class Plugins::Gallery::Admin::GalleriesController < Plugins::Gallery::AdminController
  def index
  end

  def new
    @gallery = current_site.galleries.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end
end
