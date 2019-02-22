require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    context 'ページタイトルがある時' do
      base_title = 'Yuto Sasaki Home Page.'
      page_title = 'Page title.'
      it 'Yuto Sasaki Home Page. | Page title.が返却されること' do
        expect(full_title(page_title)).to eq(base_title + ' | ' + page_title)
      end
    end

    context 'ページタイトルがない時' do
      it 'Yuto Sasaki Home Page.と返却されること' do
        base_title = 'Yuto Sasaki Home Page.'
        expect(full_title('')).to eq(base_title)
      end
    end
  end
end
