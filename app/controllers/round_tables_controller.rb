class RoundTablesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_round_table, only: %i[ show edit update destroy ]
  def index
    @round_tables = RoundTable.all
  end
  def show
  end
  def new
    @round_table = RoundTable.new
  end
  def create
    @round_table = current_user.founded_round_tables.build(round_table_params)
    if @round_table.save
      redirect_to @round_table, notice: "You founded #{@round_table.title}!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @round_table.update(round_table_params)
      redirect_to @round_table, notice: "Table updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @round_table.destroy
    redirect_to root_path, notice: "Round Table has been disbanded"
  end
  private
  def round_table_params
    params.expect(round_table: [ :title, :description ])
  end

  def set_round_table
    @round_table = RoundTable.find(params[:id])
  end
end
