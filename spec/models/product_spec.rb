require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "race bike", description: "Great bike")
    @user = FactoryGirl.build(:user, email: "not_an_email")
    @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
    @product.comments.create!(rating: 3, user: @user, body: "Nice bike!")
    @product.comments.create!(rating: 5, user: @user, body: "Amazing bike!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "Nice Bike")).not_to be_valid
  end
end