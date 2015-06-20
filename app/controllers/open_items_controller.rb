class OpenItemsController < ApplicationController
  before_action :set_open_item, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /open_items
  # GET /open_items.json
  def index
    @open_items = OpenItem.all
  end

  # GET /open_items/1
  # GET /open_items/1.json
  def show
  end

  # GET /open_items/new
  def new
    @open_item = OpenItem.new
  end

  # GET /open_items/1/edit
  def edit
  end

  # POST /open_items
  # POST /open_items.json
  def create
    @open_item = OpenItem.new(open_item_params)

    respond_to do |format|
      if @open_item.save
        format.html { redirect_to @open_item, notice: 'Open item was successfully created.' }
        format.json { render :show, status: :created, location: @open_item }
      else
        format.html { render :new }
        format.json { render json: @open_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /open_items/1
  # PATCH/PUT /open_items/1.json
  def update
    respond_to do |format|
      if @open_item.update(open_item_params)
        format.html { redirect_to @open_item, notice: 'Open item was successfully updated.' }
        format.json { render :show, status: :ok, location: @open_item }
      else
        format.html { render :edit }
        format.json { render json: @open_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /open_items/1
  # DELETE /open_items/1.json
  def destroy
    @open_item.destroy
    respond_to do |format|
      format.html { redirect_to open_items_url, notice: 'Open item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_item
      @open_item = OpenItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def open_item_params
      params.require(:open_item).permit(:task, :date, :user_id, :notes, :completed)
    end
end
