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

  describe 'GET #edit' do
    include SessionsHelper
    let(:user) { create(:user) }
    before do
      log_in user
    end

    it 'リクエストが成功すること' do
      get :edit, params: { id: user }
      expect(response.status).to eq 200
    end

    it 'editテンプレートが表示されること' do
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get :new
      expect(response.status).to eq 200
    end

    it 'newテンプレートにrenderされること' do
      get :new
      expect(response).to render_template :new
    end

    it '@userがnewされていること' do
      get :new
      expect(assigns :user).not_to be_nil
    end
  end

  describe 'GET #show' do
    include SessionsHelper
    context 'ユーザが存在する時' do
      let(:user) { create :user }

      it 'リクエストが成功すること' do
        get :show, params: { id: user }
        expect(response.status).to eq 200
      end

      it 'showテンプレートが表示されること' do
        get :show, params: { id: user }
        expect(response).to render_template :show
      end

      it '@userを取得できていること' do
        get :show, params: { id: user }
        expect(assigns :user).to eq user
      end
    end

    context 'ユーザが存在しない時' do
      subject { -> { get :show, params: { id: 1 } } }
      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'PUT #update' do
    include SessionsHelper
    let(:user) { create(:user) }

    context 'パラメータが正常な時' do
      before do
        log_in user
      end
      it 'リクエストが成功すること' do
        put :update, params: { id: user, user: attributes_for(:user) }
        expect(response.status).to eq 302
      end

      it 'ユーザ名が更新されること' do
        expect do
          put :update, params: { id: user, user: attributes_for(:user2) }
        end.to change { User.find(user.id).name }.from('testUser1').to('testUser2')
      end

      it 'リダイレクトすること' do
        put :update, params: { id: user, user: attributes_for(:user2) }
        expect(response).to redirect_to user
      end
    end

    context 'パラメータが不正な時' do
      before do
        log_in user
      end

      it 'リクエストが成功すること' do
        put :update, params: { id: user, user: attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end

      it 'edit画面へ遷移すること' do
        put :update, params: { id: user, user: attributes_for(:user, :invalid) }
        expect(response).to render_template 'edit'
      end
    end
  end

  describe 'DELETE #destroy' do
    include SessionsHelper
    before do
      log_in admin
    end
    let(:user) { create :user }
    let(:admin) { create(:admin) }
    it 'リクエストが成功すること' do
      delete :destroy, params: { id: admin }
      expect(response.status).to eq 302
    end

    it 'ユーザが削除されること' do
      expect do
        delete :destroy, params: { id: admin }
      end.to change(User, :count).by(-1)
    end

    it 'ユーザ一覧にリダイレクトされること' do
      delete :destroy, params: { id: admin }
      expect(response).to redirect_to users_url
    end

  end
end