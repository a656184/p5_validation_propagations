class Event < ActiveRecord::Base
  require 'date'

  validates :date, :title, :organizer_name, :organizer_email, presence: true # event title is empty
  validate :valid_date_format # date is a valid format
  validate :validate_date_in_the_future # date is in the future
  validates :title, uniqueness: true # event title is already taken
  validates :organizer_email, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i,
    message: "Invalid Email" }
  

  def valid_date_format
    unless self.date && test_for_valid_date
      errors.add(:date, " must be a valid date format")
    end
  end

  def test_for_valid_date
    if self.date
      Date.valid_date?(self.date.year, self.date.month, self.date.day)
    else
      false
    end
  end

  def validate_date_in_the_future
    current_date = Date.today
    if self.date && self.date < current_date
      errors.add(:date, " must be at a future date") 
    end
  end

end




# errors.full_messages

# if @record.errors.any?
#   <ul>
#     <% @record.errors.each do |error| 
#       <li>error</li>

# <input type="date">
