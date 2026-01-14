class RoundTablesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_round_table, only: %i[ show edit update destroy ]
  def index
    @round_tables = RoundTable.all
  end
  def show
  end
  def new
    @round_tables = RoundTable.new
  end
  def create
    @round_table = RoundTable.new(event_params)
    if @round_table.save
      redirect_to @round_table, notice: "You founded #{@round.table.title}!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def round_table_params
    params.expect(round_table: [ :title, :description ])
  end

  def set_round_table
    @round_table = RoundTable.find(params[:id])
  end
end
