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
  
  describe "custom methods" do
    describe "works with max vote count" do
      before do
        @work = Work.create catagory: "movie", title: "Mulan", creator: "disney", publication_year: 1990, description: "girl who loves books falls in love with prince"
        
        @user = User.create name: "muffin"
        
        @work_one = Vote.create date: Date.new(2019,10,8), user_id: User.first.id, work_id: @work.id, category: "movie", title: "Mulan", creator: "Disney", publication_year: 1990, description: "girl who loves books falls in love with prince"
        @work_two = Vote.create date: Date.new(2019,10,9), user_id: User.first.id, work_id: @work.id, category: "book", title: "Angelina Ballerina", creator: "Shelia Walsh", publication_year: 2008, description: "mouse becomes a ballerina"
        @work_three = Vote.create date: Date.new(2019,10,10), user_id: User.first.id, work_id: @driver.id, category: "album", title: "Surfer Girl", creator: "Beach Boys", publication_year: 1963, description: "third studio album by the Beach Boys"
      end
      it "must aggregate works with max vote count" do
        expect(@work.featured).must_equal 3
      end
    end
  end
end
end
