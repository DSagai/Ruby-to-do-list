# List class contains tasks, which are needed to be completed
# during certain day.
class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  before_save :gen_token

  private def gen_token
    unless link_token
      self.link_token = SecureRandom.uuid
    end
  end




end
