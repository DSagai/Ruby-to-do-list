# List class contains tasks, which are needed to be completed
# during certain day.
class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates_presence_of :date

  before_save :gen_token

  def self.find_by_token(link_token)
    return List.where(link_token: link_token).first
  end

  private def gen_token
    unless link_token
      self.link_token = SecureRandom.uuid
    end
  end



end
