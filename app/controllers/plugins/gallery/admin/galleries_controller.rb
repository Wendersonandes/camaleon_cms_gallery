class Plugins::Gallery::Admin::GalleriesController < Plugins::Gallery::AdminController
  before_action :set_gallery, only: [:show,
                                     :edit,
                                     :update,
                                     :destroy]
  def index
     @galleries = current_site.galleries.paginate(:page => params[:page], :per_page => current_site.admin_per_page)
  end

  def new
    @gallery = current_site.galleries.new
  end

  def show
  end

  def edit
  end

  def create
    @gallery = current_site.galleries.new(gallery_params)

    if @gallery.save
      flash[:notice] = "Gallery has been created."
      redirect_to admin_plugins_gallery_gallery_path(@gallery)
    else
      flash[:notice] = "Gallery has not been created."

      render 'new'
    end

  end


  def update
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end
  def set_gallery
    @gallery = current_site.galleries.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The gallery you were looking" +
      " for could not be found."
    redirect_to galleries_path
  end
end
