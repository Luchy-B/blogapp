require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @first_like = Like.create(author_id: 1, post_id: 1)
    @first_like.save
  end

  it "should give the author_id of like variable's value" do
    expect(@first_like.author_id).to eq(1)
  end

  it "should give the post_id of like variable's value" do
    expect(@first_like.post_id).to eq(1)
  end

  describe 'Like Validation checks' do
    it 'author_id must not be blank' do
      @first_like.author_id = nil
      expect(@first_like).not_to be_valid
    end
  end
end
