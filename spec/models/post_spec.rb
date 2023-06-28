require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @first_post = Post.create(title: 'My first post', text: 'This is the content of my first post')
    @first_post.save
  end

  it "should give the title of post variable's value" do
    expect(@first_post.title).to eq('My first post')
    expect(@first_post.text).to eq('This is the content of my first post')
  end

  it 'should set the comments counter to value provided' do
    expect(@first_post.comments_counter).to be(nil)
  end

  describe 'Post Validation checks' do
    it 'Title must not be blank' do
      @first_post.title = nil
      expect(@first_post).not_to be_valid
    end
  end
end
