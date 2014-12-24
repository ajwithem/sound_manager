class EntriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def new
    @entries = Entry.new
  end

  def create
    @entries = Entry.new(entry_params)

    if @entries.save
      redirect_to @entries
    else
      render 'new'
    end
  end

  def show
    @entries = Entry.find(params[:id])
  end
  def index
    @entries = Entry.order(sort_column + " " + sort_direction)
  end
  def edit
    @entries = Entry.find(params[:id])
  end
  def update
    @entries = Entry.find(params[:id])

    if @entries.update(entry_params)
      redirect_to @entries
    else
      render 'edit'
    end
  end
  def destroy
    @entries = Entry.find(params[:id])
    @entries.destroy
    redirect_to @entries
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :artist, :format, :length, :size)
  end

  def sort_column
    Entry.column_names.include?(params[:sort]) ? params[:sort] : "Title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end