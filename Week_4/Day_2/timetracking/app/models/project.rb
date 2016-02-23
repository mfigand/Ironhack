class Project < ActiveRecord::Base
  self.table_name = 'projects'
  has_many :entries

  def self.iron_find(id)
    where(id: id).first
  end

  def self.clean_old
    date = Time.now.midnight - 1.week
    p = Project.where("created_at < ?", date)
    p.destroy_all
  end

  def self.last_created_proyects(number)
    order(created_at: :desc).limit(number)
  end

  def total_hours_in_month(month, year)
    # from = Date.new(year, month, 1)
    # to = from.end_of_month
    entries = self.find(date.year).find(date.month)
    entries.to_a.sum(&:hours)

  end



end
