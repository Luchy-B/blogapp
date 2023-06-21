require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/index' do
    it 'should return success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a list of posts with comments for a given user')
    end
  end

  describe 'GET/index' do
    it 'should render the index template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET/show' do
    it 'correct placeholder text in response body' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Post details for a given user')
    end
  end
end
