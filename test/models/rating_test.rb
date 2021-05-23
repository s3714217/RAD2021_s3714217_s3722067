require 'test_helper'

class RatingTest < ActiveSupport::TestCase
   test "check rating datafields function" do
    @rating = Rating.find_by id: 1
    assert @rating.valid?
    assert @rating.ratingscore == "Amazing"
  end
end