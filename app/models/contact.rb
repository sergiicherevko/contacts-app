class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :number, uniqueness: true
  validates :last_name, presence: true

  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end


  def as_json
    {
      id: self.id,
      first_name: self.first_name,
      last_name: self.last_name,
      mid_name: self.mid_name,
      number: self.number,
      full_name: self.full_name
    }
  end  
end
