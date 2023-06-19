require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @first_comment = Comment.create(author_id: 1, post_id: 1, text: 'This is my first comment')
    @first_comment.save
  end

  it "should give the author_id of comment variable's value" do
    expect(@first_comment.author_id).to eq(1)
  end

  it "should give the post_id of comment variable's value" do
    expect(@first_comment.post_id).to eq(1)
  end

  it "should give the text of comment variable's value" do
    expect(@first_comment.text).to eq('This is my first comment')
  end

  describe 'Comment Validation checks' do
    it 'author_id must not be blank' do
      @first_comment.author_id = nil
      expect(@first_comment).not_to be_valid
    end
  end
end
