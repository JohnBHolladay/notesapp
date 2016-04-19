class Notepad < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  validates :url, presence: true, uniqueness: true
end
