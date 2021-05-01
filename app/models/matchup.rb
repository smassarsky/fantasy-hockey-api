class Matchup < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :team

  has_many :user_matchups
  has_many :users, through: :user_matchups
  has_many :picks, through: :user_matchups
  has_many :players, through: :picks

  has_many :invitations

  validates_presence_of :name, :start_date, :end_date, :team
  validates :status, inclusion: %w[Pre-Draft Draft Active Complete]

  private

  def dates
    if start_date >= end_date
      errors.add(:start_date, "Must be before end date.")
      errors.add(:end_date, "Must be after start date.")
    end
  end

  def def_status
    self.status = "Pre-Draft" if self.status.nil?
  end

  def set_draft_order
    self.user_matchups.order('random()').each_with_index do |usermatchup, index|
      usermatchup.update(draft_order: index)
    end
  end

  def delete_extra_invitations
    self.invitations.destroy_all
  end

end