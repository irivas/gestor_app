class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update, :edit_password, :update_password]
  before_filter :admin_user, :only => :destroy

  #before_filter :modifica_pass, :only => :update_password
  # GET /users
  # GET /users.json
  def index
    @users = User.search(params[:search]).paginate(:per_page => 2, :page => params[:page])
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
    #@action = "New Action"
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
    #lo ponemos en la zona privada dentro de correct_user
    @title = "Edit user"
    #@action = "Edit Action"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @action_password = 1
    @update_pass = 0
    if @user.save
      sign_in @user
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
    @action_password = 0
    @update_pass = 0
    #puts @change_password
    if @user.update_attributes(params[:user])
                               # :name    => params[:user][:name],
      #                        :surname  => params[:user][:surname],
       #                       :nif      => params[:user][:nif],
        #                      :address  => params[:user][:address],
         #                     :email    => params[:user][:email],
          #                    :phone    => params[:user][:phone])
    #if @user.valid?
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
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  def edit_password
    @title = "Editar password"
  end

  def update_password
    #ha llamado antes a correct_user
    @title = "Update password"
    ##modificar password
    @action_password = 1
    @update_pass = 1
    #if User.modifica_password?(old_password, password, password_confirmation)
    if @user.update_attributes(params[:user])
      flash[:success] = "Password modificada"
      redirect_to @user
    else
      @title = "Editar password"
      render 'edit_password'
    end   
    ##############################
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

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
   
end
