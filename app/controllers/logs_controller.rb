class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
    @crew = User.crew
    @open_items = OpenItem.current_open_items
    @daily_activities = DailyActivity.all
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new
    @log.date = Date.today
    @log.created_by = current_user
    @log.notes = params[:log][:notes]
    @log.save
    create_completed_tasks
    create_in_progresses
    create_on_duties
    update_expenses
    pdf = @log.create_pdf
    binding.pry
    @log.pdf = pdf
    binding.pry
    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:pdf, :date, :created_by)
    end
    def create_completed_tasks
      daily_activities = params[:log][:daily_activities]
      daily_activities.each do |activity|
         CompletedTask.create({
          daily_activity_id: activity[0],
          log_id: @log.id,
          completed: activity[1][:completed],
          notes: activity[1][:notes]
        })
      end
    end
    def create_on_duties
      on_duties = params[:log][:status]
      on_duties.each do |on_duty|
        OnDuty.create({
          log_id: @log.id,
          user_id: on_duty[0],
          status: on_duty[1]
        })
      end
    end
    def create_in_progresses
      in_progresses = params[:log][:open_items]
      in_progresses.each do |in_progress|
        InProgress.create({
          log_id: @log.id,
          open_item_id: in_progress[0],
          notes: in_progress[1][:notes]
          })
        oi = OpenItem.find(in_progress[0])
        oi.user_id = in_progress[1]["user_id"] if in_progress[1]["user_id"].present?
        oi.completed = in_progress[1]["completed"] if in_progress[1]["completed"].present?
        oi.save
      end

    end
    def update_expenses
      @expenses = Expense.unassaigned_expenses
      @expenses.update_all(log_id: @log.id)
    end
end
