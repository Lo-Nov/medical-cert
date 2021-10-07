class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create index show]
  before_action :find_user, except: %i[create index]


  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    # user = User.new(user_params)
    # user.update(created_at: Date.today)
    # response = {
    #   status: 200,
    #   message: 'User created',
    #   data: user
    # }
    # render json: response

    user = User.new(user_params)
    if user.save
      render json: { status: '200', message: 'User created successfully', data: user }, status: :created
    else
      render json: { status: '422', message: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end



  private

  def find_user
    #   @user = User.find_by_username!(params[:_username])
    @user = User.find(params[:id])
   rescue ActiveRecord::RecordNotFound
     render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation, :usertype, :phone)
  end
end
