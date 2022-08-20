# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password')
    end

    before(:example) { get user_foods_path(user, user.foods) }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end
