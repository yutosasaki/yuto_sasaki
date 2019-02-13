require 'rails_helper'

describe '#valid?' do
  subject(:user) { create(:user) }
  it { is_expected.to be_valid }

  context 'name blank'
  let(:no_name_user) { create(:no_name_user) }
  it { expect{(no_name_user)}.to raise_error(ActiveRecord::RecordInvalid) }
end

describe '#digest' do
  context '文字列のハッシュを返す' do
    let(:user) { create(:user) }
    it { is_expected.to satisfy { user.password_digest.length > 10 } }
  end
end