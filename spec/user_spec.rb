require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @first_user = User.create(name: 'Blessing', photo: '', bio: 'FullStack Web Developer')
    @first_user.save
  end

  it "should give the name of user variable's value" do
    expect(@first_user.name).to eq('Blessing')
    expect(@first_user.bio).to eq('FullStack Web Developer')
    expect(@first_user.photo).to eq('')
  end

  it 'should set the post counter to value provided' do
    expect(@first_user.post_counter).to be(nil)
  end

  describe 'User Validation checks' do
    it 'Name must not be blank' do
      @first_user.name = nil
      expect(@first_user).not_to be_valid
    end
  end
end
