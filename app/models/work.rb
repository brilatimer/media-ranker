class Work < ApplicationRecord
  has_many :votes
  
  def self.featured
    featured_work = Work.all.max_by do |work|
      work.votes.count 
    end
    return featured_work
  end
end

