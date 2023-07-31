class UsersController < ApplicationController
  def index 
    # admin
    @users = User.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @users, status: :ok }
    end
  end

  def list
    @users = User.all

    render json: ActiveModel::Serializer::CollectionSerializer.new(@users, each_serializer: UserSerializer)
  end

  def show_id
    render json: { id: User.find(params[:id]).id }
  end

  def show
    # show current user
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # admin
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
    def user_params_with_roles
      params.require(:user).permit(:username, :password, :role)
    end
end
