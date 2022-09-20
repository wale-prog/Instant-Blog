require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) do
      get '/users/1/posts'
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should include the template text' do
      expect(response.body).to include('Posts listing for all posts in the database')
    end

    it 'should render template correctly' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:example) do
      get '/users/1/posts/2'
    end

    it 'should render template correctly' do
      expect(response).to render_template(:show)
    end

    it 'should include the template text' do
      expect(response.body).to include('Post listing for an individually selected post')
    end

    it 'should be successful' do
      expect(response).to have_http_status(:ok)
    end
  end
end
