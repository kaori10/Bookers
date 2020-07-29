class TodolistsController < ApplicationController

  def new
  	@list = List.new
    @lists = List.all
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Book was successfully created."
      redirect_to todolist_path(@list.id)

    else
      render "new"
    end
  end

  def index
  	@lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    flash[:success] = "Book was successfully updated."
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to todolists_new_path
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end