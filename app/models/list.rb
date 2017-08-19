# List class contains tasks, which are needed to be completed
# during certain day.
class List < ApplicationRecord
  self.primary_key = "link_token"
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates_presence_of :date

  before_save :gen_token


  private def gen_token
    unless link_token
      self.link_token = SecureRandom.uuid
    end
  end



end
