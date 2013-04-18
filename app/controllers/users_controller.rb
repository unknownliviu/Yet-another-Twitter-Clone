class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only:  :destroy
  before_filter :no_create_after,only: [:new, :create]

  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end  

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy unless current_user?(user)
    flash[:success] = "User killed!"
    redirect_to users_url(page: params[:page])
  end


private
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Yeah... can't go there unless you sign in." 
    end
  end

  def no_create_after
    if signed_in?
      redirect_to root_path, notice: "Nope, can't do that while signed in"
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, notice: "Trying to hack others, are we?" unless current_user?(@user)
  end  

  def admin_user
    redirect_to root_path, notice: "Chuck Norris will hear about this!" unless current_user.admin?
  end
end
