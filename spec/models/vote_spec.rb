require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "is valid with a value of '1'" do
        vote = Vote.new
        vote.value = 1

        expect(vote).to be_valid
      end

      it "is valid with a value of '-1'" do
        vote = Vote.new
        vote.value = -1

        expect(vote).to be_valid
      end

      it "is invalid with a value of '2'" do
        vote = Vote.new
        vote.value = 2

        expect(vote).not_to be_valid
      end
    end
  end
end
