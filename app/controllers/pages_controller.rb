class PagesController < ApplicationController
=begin
pages     GET    /pages(.:format)               pages#index
          POST   /pages(.:format)               pages#create
new_page  GET    /pages/new(.:format)           pages#new
edit_page GET    /pages/:id/edit(.:format)      pages#edit
page      GET    /pages/:id(.:format)           pages#show
          PATCH  /pages/:id(.:format)           pages#update
          PUT    /pages/:id(.:format)           pages#update
          DELETE /pages/:id(.:format)           pages#destroy
=end
  def index
    @pages = Page.all
  end

  def create
    @page = Page.new(page_params)
    @page.user = current_user

    if @page.save
     flash[:notice] = "Page was saved."
     redirect_to @page
    else
     flash.now[:alert] = "There was an error saving the page. Please try again."
     render :new
    end
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def show
    @page = Page.find(params[:id])
  end

  def update
     @page = Page.find(params[:id])
     @page.assign_attributes(page_params)

     if @page.save
       flash[:notice] = "Page was updated."
       redirect_to @page
     else
       flash.now[:alert] = "There was an error saving the page. Please try again."
       render :edit
     end
   end

  def destroy
  @page = Page.find(params[:id])

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
    params.require(:page).permit(:user, :title, :body)
  end

end
