class Notepad < ActiveRecord::Base
  has_many :notes, -> {order 'created_at asc'}, dependent: :destroy
  validates :url, presence: true, uniqueness: true

  #The url identifier should always be uppercase. 
  def url=(s)
    write_attribute(:url, s.to_s.upcase)
  end

  def children
    @children ||= (self.notes.all).sort(&:created_at)
  end
end
