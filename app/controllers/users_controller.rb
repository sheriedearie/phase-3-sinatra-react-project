class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    User.all.to_json
  end

  # POST: /users
  post "/users" do
    user = User.create(
      username: params[:username],
      email: params[:email]
    )
    user.to_json
  end

  # GET: /users/5
  get "/users/:id" do
    find_user
    if @user
      serialized_user
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # GET: /users/name
  get "/users/by_name/:name" do
    find_user_by_name
    if @user
      @user.to_json(include: [todos: {include: [:user]}])

    else
      {errors: "Record not found with name #{params['name']}"}.to_json
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    find_user
    if @user && @user.update(params)
      serialized_user
    elsif !@user
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @user.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /users/5/delete
  delete "/users/:id" do
    user = User.find(params[:id])
    if user.destroy
      {messages: "User successfully destroyed"}.to_json
    else
      {errors: "Cannot delete user"}.to_json
      end
    end

    def find_user
      @user = User.find_by_id(params["id"])
    end
  
    def find_user_by_name
      @user = User.find_by_username(params["name"])
    end

    def serialized_user
      @user.to_json(include: :todos)
    end
  end