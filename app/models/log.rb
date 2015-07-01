class Log < ActiveRecord::Base
  has_many :expenses
  has_many :in_progresses
  has_many :open_items, through: :in_progresses
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by
  has_many :on_duties
  has_many :users, through: :on_duties
  accepts_nested_attributes_for :expenses
  has_many :completed_tasks
  has_many :daily_activities, through: :completed_tasks
  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  def create_pdf
    log = self
    pdf = Prawn::Document.new

    pdf.text "Captain's Log for #{Date.parse(log.date)}", :align => :center, :size => 18
    pdf.move_down 20
    pdf.text "Crew On Board", :size => 16
    log.on_duties.each do |on_duty|
      pdf.text "#{on_duty.user.name} - #{on_duty.status}", :size => 12
    end
    pdf.move_down 15
    pdf.stroke_horizontal_rule
    pdf.move_down 15
    pdf.text "Open Items", :size => 16
    log.in_progresses.each do |in_progress|
      open_item = in_progress.open_item
      completion_text =  open_item.completed ? "COMPLETED" : "IN PROGRESS"
      pdf.text "#{open_item.task}(#{open_item.user.name} - #{open_item.date}): #{in_progress.notes} #{completion_text}", :size => 12
    end
    pdf.move_down 15
    pdf.stroke_horizontal_rule
    pdf.move_down 15
    pdf.text "Daily Activities", :size => 16
    completed_tasks = log.completed_tasks.where(completed: true)
    pdf.text "Completed Today: ", :size => 14
    completed_tasks.each do |completed_task|
      daily_activity = completed_task.daily_activity
      pdf.text "#{daily_activity.user.name} - #{daily_activity.description} - NOTES: #{completed_task.notes}", :size => 12
      pdf.move_down 16
    end
    incomplete_tasks = log.completed_tasks.where("completed IS NOT true")
    pdf.text "Not Completed Today: ", :size => 14
    incomplete_tasks.each do |incomplete_task|
      daily_activity = incomplete_task.daily_activity
      pdf.text "#{daily_activity.user.name} - #{daily_activity.description} - NOTES: #{incomplete_task.notes}", :size => 12
      pdf.move_down 16
    end
    pdf.move_down 15
    pdf.stroke_horizontal_rule
    pdf.move_down 15
    pdf.text "Expenses", :size => 16
    expenses = log.expenses
    expenses.each do |expense|
      if expense.type == "Check"
        pdf.text "CHECK ##{expense.check_number} TO #{expense.check_to} FOR $#{expense.amount.to_f} - #{expense.notes}", :size => 12
      else
        pdf.text "#{expense.type.upcase} - $#{expense.amount.to_f} - #{expense.notes}", :size => 12
      end
    end
    pdf.move_down 15
    pdf.stroke_horizontal_rule
    pdf.move_down 15
    pdf.text "Notes", :size => 16
    pdf.text log.notes, :size => 12
    pdf.render_file File.join(Rails.root, "pdfs", "x.pdf")
    log.pdf = File.open("#{Rails.root}/pdfs/x.pdf")
    log.save!
  end
end
