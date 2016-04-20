class PagesController < ApplicationController
  def index
    @pages = policy_scope(Page)
    @user = current_user
    @public_pages = Page.all.where(private:false)
    @created_pages = @user.created_pages
    @collaborating_pages = @user.collaborating_pages
  end

  def show
    @page = Page.find(params[:id])
    authorize @page
  end

  def new
    @page = Page.new
    authorize @page
  end

  def create
    @page = Page.new(page_params)
    @page.creator = current_user
    authorize @page

    if @page.save
      @page.collaborators = Page.update_collaborators(params[:page][:collaborators])
      flash[:notice] = "Page was saved."
      redirect_to @page
    else
      flash.now[:alert] = "There was an error saving the page. Please try again."
      render :new
    end
  end


  def edit
    @page = Page.find(params[:id])
    authorize @page
  end

  def update
     @page = Page.find(params[:id])
     @page.assign_attributes(page_params)
     authorize @page

     if @page.save
       @page.collaborators = Page.update_collaborators(params[:page][:collaborators])
       flash[:notice] = "Page was updated."
       redirect_to @page
     else
       flash.now[:alert] = "There was an error saving the page. Please try again."
       render :edit
     end
   end

  def destroy
  @page = Page.find(params[:id])
  authorize @page

    if @page.destroy
      flash[:notice] = "\"#{@page.title}\" was deleted successfully."
      redirect_to pages_path
    else
      flash.now[:alert] = "There was an error deleting the page."
      render :show
    end
  end

  private
    def page_params
      params.require(:page).permit(:user, :creator, :collaborator, :title, :body, :private)
    end

  end
