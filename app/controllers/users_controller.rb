class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  # GET /users
  # GET /users.json
  def index
    @users = User.search(params[:search])
    @title = "Users"
    #if params[:search]
     # @users = User.all(:conditions => ['name LIKE ?', 
      #                                        "%#{params[:search]}%"])
    #else
     # @users = User.all
      #@title = "All users"
    #end  
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @title = "Sign up"
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
    #lo ponemos en la zona privada dentro de correct_user
    @title = "Edit user"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Bienvenido al gestor de usuarios"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

    def authenticate
      deny_access unless signed_in?
      #deny_access definido en sessions_helper.rb
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      #current_user? definido en sessions_helper.rb
    end
end
