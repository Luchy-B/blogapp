require 'rails_helper'

RSpec.describe 'GET/show', type: :request do
  describe 'with success response' do
    it 'should return success' do
      get '/users/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Lists of all users')
    end

    describe 'GET/index' do
      it 'should render the index template' do
        get '/users/'
        expect(response).to render_template(:index)
      end
    end

    describe 'GET/show' do
      it 'correct placeholder text in response body' do
        get '/users/:id'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Information about a given user')
      end
    end
  end
end
