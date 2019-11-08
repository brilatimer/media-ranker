class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  
  validates :user, presence: true
  validates :work, presence: true
  validates :user, uniqueness: { scope: :work,
    message: "user has already voted for this work" } # https://guides.rubyonrails.org/active_record_validations.html#uniqueness
    
    def self.create_vote(work_id, user_id)
      # Check first to see if a vote exists
      return Vote.create(work_id: work_id, user_id: user_id)
    end
  end
  