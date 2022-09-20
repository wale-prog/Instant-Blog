require 'rails_helper'

RSpec.describe 'Users', type: :request do
	describe 'GET /index' do
		before(:example) { get users_path }

		it 'is a success' do 
			expect(response).to have_http_status(:ok)
		end

    it 'Should include the template text' do
			expect(response.body).to include('User listing page for all users')
		end
		
		it 'renders index template' do
			expect(response).to render_template(:index)
		end
	end

	describe 'GET /show' do
		before(:example) do
			get '/users/1'
		end

		it 'is a success' do 
			expect(response).to have_http_status(:ok)
		end

    it 'Should include the template text' do
			expect(response.body).to include('User listing page for a specific user')
		end
		
		it 'renders show template' do
			expect(response).to render_template(:show)
		end
	end
end