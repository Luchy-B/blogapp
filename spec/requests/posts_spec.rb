require 'rails_helper'

describe 'GET/show' do
  context 'with success response' do
    it 'should return success' do
        get '/users/:user_id/posts'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Here is a list of posts with comments for a given user')
    end

    it 'should return success' do
        get '/users/:user_id/posts/:id'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Post details for a given user')
    end
  end
end