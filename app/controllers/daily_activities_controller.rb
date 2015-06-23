class DailyActivitiesController < ApplicationController
  before_action :set_daily_activity, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /daily_activities
  # GET /daily_activities.json
  def index
    @daily_activities = DailyActivity.all
  end

  # GET /daily_activities/1
  # GET /daily_activities/1.json
  def show
  end

  # GET /daily_activities/new
  def new
    @daily_activity = DailyActivity.new
    @crew = User.crew
  end

  # GET /daily_activities/1/edit
  def edit
    @crew = User.crew
  end

  # POST /daily_activities
  # POST /daily_activities.json
  def create
    @daily_activity = DailyActivity.new(daily_activity_params)

    respond_to do |format|
      if @daily_activity.save
        format.html { redirect_to @daily_activity, notice: 'Daily activity was successfully created.' }
        format.json { render :show, status: :created, location: @daily_activity }
      else
        format.html { render :new }
        format.json { render json: @daily_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_activities/1
  # PATCH/PUT /daily_activities/1.json
  def update
    respond_to do |format|
      if @daily_activity.update(daily_activity_params)
        format.html { redirect_to @daily_activity, notice: 'Daily activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_activity }
      else
        format.html { render :edit }
        format.json { render json: @daily_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_activities/1
  # DELETE /daily_activities/1.json
  def destroy
    @daily_activity.destroy
    respond_to do |format|
      format.html { redirect_to daily_activities_url, notice: 'Daily activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_activity
      @daily_activity = DailyActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_activity_params
      params.require(:daily_activity).permit(:user_id, :description, :date)
    end
end
