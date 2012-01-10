class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if params[:search]
      @users = User.find(:all, :conditions => ['name LIKE ?', 
                                              "%#{params[:search]}%"])
    else
      @users = User.all
      @title = "All users"
    end  
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
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])

    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    
  end
end
