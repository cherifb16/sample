class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end


  # GET /users/logout
  def logout
    session.delete(:user_id)
     redirect_to :controller => 'home', :action => 'index'
  end

  # GET /users/login
  def login
    @user = User.new
  end

  # POST /users/singin
  def signin
    @user = User.new(login_params)
    _user = User.where(username: login_params[:username], password: login_params[:password]).first()
    if login_params[:gcmid]
      _user.update_column(:gcmid, login_params[:gcmid])
    end
    respond_to do |format|
      if _user
        @user = _user
        session[:user_id] = _user.id
        format.html { redirect_to :controller => 'home', :action => 'index'  }
        format.json { render :show, status: :created, location: _user }
      else
        @user.errors.add(:username, :blank, message: "Invalid credentials")
        format.html { render :login }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :city, :username, :password, :address, :gcmid)
    end

    def login_params
      params.require(:user).permit(:username, :password, :gcmid)
    end
end
