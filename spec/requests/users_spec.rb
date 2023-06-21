require 'rails_helper'

describe 'GET/show' do
  context 'with success response' do
    it 'should return success' do
      get '/users/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Lists of all users')
    end

    it 'should return success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Information about a given user')
    end
  end
end
