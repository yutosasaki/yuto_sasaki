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

  describe 'POST #create' do
    include SessionsHelper
    let(:user_params) { build(:user_params) }

    context 'パラメータが正常な時' do
      it 'リクエストが成功すること' do
        post :create, params: { user: attributes_for(:user) }
        expect(response.status).to eq 302
      end
    end

    context '登録成功' do
      it 'root画面へリダイレクトされること' do
        expect(post :create, params: { user: attributes_for(:user) }).to redirect_to root_url
      end
    end

    context '登録失敗' do
      it 'ユーザ新規作成ページへ遷移すること' do
        post :create, params: { user: attributes_for(:user, :invalid) }
        expect(response).to render_template :new
      end
    end

    it 'エラーが表示されること' do
      post :create, params: { user: attributes_for(:user, :invalid) }
      expect(assigns(:user).errors.any?).to be_truthy
    end

  end
end