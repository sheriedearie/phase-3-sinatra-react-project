class TodosController < ApplicationController

  get "/todos" do
    Todo.all.to_json(include: :user)
  end

  # POST: /todos
  post "/todos" do
    user = User.find_by_username(params[:username])
    if user
    todo = user.todos.create(
      name: params[:name],
      task: params[:task],
      completed: params[:completed]
      # what to have for the default value for a boolean
    )
    todo.to_json
  else 
    {error: "user cannot be found by that username"}.to_json
    end
  end

# GET: /todos
  get "/todos/:id" do
    todo = Todo.find_by_id(params[:id]).to_json
  end

# DELETE: /todos/5/delete
  delete "/todos/:id" do
    todo = Todo.find_by_id(params[:id])
    if todo.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Cannot delete todo list"}.to_json
      end
    end

    # PATCH
    patch "/todos/:id" do
      todo = Todo.find_by_id(params[:id])
      if todo&.update(completed: params[:completed])
        {messages: "Record successfully updated"}.to_json
      else
        {errors: "Cannot update todo list"}.to_json
        end
      end
  end
