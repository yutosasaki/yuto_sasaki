require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#index' do
    include SessionsHelper
    let(:user) { create(:user) }

    context 'ログイン' do
      before do
        log_in user
        get :index, params: {}, session: {}
      end

      it 'ログイン後のviewページへ遷移すること' do
        expect(response).to render_template :index
      end
    end

    context '未ログイン' do
      before do
        get :index, params: {}, session: {}
      end
      it 'ログイン画面へリダイレクトされること' do
        expect(response).to redirect_to login_url
      end
    end

  end
end