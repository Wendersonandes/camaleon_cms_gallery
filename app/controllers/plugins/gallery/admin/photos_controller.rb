class Plugins::Gallery::Admin::PhotosController < Plugins::Gallery::AdminController
  before_action :set_gallery
  before_action :set_photo, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    @photo = @gallery.photos.build
  end

  def create
    @photo = @gallery.photos.build(photo_params)
    if @photo.save
      flash[:notice] = "Photo has been added."
      redirect_to admin_plugins_gallery_gallery_path(@gallery)
    else
      flash[:alert] = "Photo has not been added."
      render "new"
    end

  end

def show
end

def edit
end

def update
end

def delete
end

private
def set_gallery
  @gallery = current_site.galleries.find(params[:gallery_id])
end
def set_photo
  @photo = @gallery.photos.find(params[:id])
end

 def photo_params
  params.require(:photo).permit(:title, :description, :image)
  end

end
