require 'test_helper'

class MediaTest < ActiveSupport::TestCase
  require "test_helper"
  
  describe Work do
    let (:new_work) {
    Work.new(category: "movie", title: "Mulan", creator: "disney", publication_year: 1990, description: "girl who loves books falls in love with prince")
  }
  it "can be instantiated" do
    # Assert
    expect(new_work.valid?).must_equal true
  end
  
  it "will have the required fields" do
    # Arrange
    new_work.save
    work = Work.first
    [:category, :title, :creator, :publication_year, :description].each do |field|
      
      # Assert
      expect(work).must_respond_to field
    end
  end
  
  describe "relationships" do
    it "can have many votes" do
      # Arrange
      new_work.save
      work = Work.first
      
      # Assert
      expect(work.votes.count).must_be :>=, 0
      work.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end
  end
  
  describe "validations" do
    it "must have a title" do
      # Arrange
      new_work.title = nil
      
      # Assert
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :title
      expect(new_work.errors.messages[:title]).must_equal ["can't be blank"]
    end
    
    it "must have a creator" do
      # Arrange
      new_work.creator = nil
      
      # Assert
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :creator
      expect(new_work.errors.messages[:creator]).must_equal ["can't be blank"]
    end
  end
  
  # # Tests for methods you create should go here
  # describe "custom methods" do
  #   describe "user login, logout, current user, upvote" do
  #     before do
  #       @work = Work.create catagory: "movie", title: "Mulan", creator: "disney", publication_year: 1990, description: "girl who loves books falls in love with prince"
  
  #       @user = User.create name: "muffin"
  
  #       @vote1 = Vote.create date: Date.new(2019,10,8), user_id: User.first.id, work_id: @work.id, cost: "2310", rating: "5"
  #       @vote2 = Vote.create date: Date.new(2019,10,9), user_id: User.first.id, work_id: @work.id, cost: "10", rating: "3"
  #       @vote3 = Vote.create date: Date.new(2019,10,10), user_id: User.first.id, work_id: @driver.id, cost: "31", rating: "1"
  #     end
  #     it "must calculate the correct average rating" do
  #       expect(@work.avg_rating).must_equal 3
  #     end
  #     it "must calculate the correct total earnings" do
  #       expect(@work.total_earnings).must_equal 1879.48
  #     end
  #   end
  #   describe "can go online" do
  #     # Your code here
  #   end
  
  #   describe "can go offline" do
  #     # Your code here
  #   end
  
  #   # You may have additional methods to test
  # end
end

end
