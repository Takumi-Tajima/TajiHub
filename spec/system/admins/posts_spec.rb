require 'rails_helper'

RSpec.describe 'ポスト機能', type: :system do
  let(:admin) { create(:admin) }

  before { sign_in admin }

  describe '閲覧機能' do
    before { create(:post, title: 'The World', content: 'Dioのスタンド') }

    it '記事データ表示されること' do
      visit admins_posts_path

      expect(page).to have_content 'タイトル'
      expect(page).to have_content '内容'
      expect(page).to have_content '作成日時'
      expect(page).to have_content '更新日時'
      expect(page).to have_content '公開ステータス'
      expect(page).to have_link 'The World'
      expect(page).to have_content 'Dioのスタンド'
      expect(page).to have_content '非公開'
      expect(page).to have_content '新規登録'
    end
  end

  describe '新規登録機能' do
    it '新規登録できること' do
      visit admins_posts_path

      expect(page).to have_content 'TajiHub : 管理者'

      click_on '新規登録'

      expect(page).to have_selector 'h1', text: '新規登録'

      fill_in 'タイトル', with: 'The World'
      fill_in '内容', with: 'Dioのスタンド'

      expect do
        click_on '登録'
        expect(page).to have_content 'ポストを登録しました'
      end.to change(Post, :count).by(1)

      expect(page).to have_content 'The World'
      expect(page).to have_content 'Dioのスタンド'
    end
  end

  describe '編集機能' do
    let!(:post) { create(:post, title: 'The World', content: 'Dioのスタンド') }

    it '編集できること' do
      visit admins_posts_path

      expect(page).to have_content 'The World'
      expect(page).to have_content 'Dioのスタンド'

      click_on 'The World'

      expect(page).to have_current_path edit_admins_post_path(post)

      fill_in 'タイトル', with: 'Star Platinum'
      fill_in '内容', with: '承太郎のスタンド'

      expect do
        click_on '更新する'
        expect(page).to have_content 'ポストを編集しました'
      end.not_to change(Post, :count)

      expect(page).to have_content 'Star Platinum'
      expect(page).to have_content '承太郎のスタンド'
      expect(page).not_to have_content 'The World'
      expect(page).not_to have_content 'Dioのスタンド'
    end
  end

  describe '削除機能' do
    let!(:post) { create(:post, title: 'The World', content: 'Dioのスタンド') }

    it '削除できること' do
      visit admins_posts_path

      expect(page).to have_content 'The World'
      expect(page).to have_content 'Dioのスタンド'

      click_on 'The World'

      expect(page).to have_current_path edit_admins_post_path(post)

      expect do
        click_on '削除する'
        expect(page).to have_content 'ポストを削除しました'
      end.to change(Post, :count).by(-1)

      expect(page).not_to have_content 'The World'
      expect(page).not_to have_content 'Dioのスタンド'
    end
  end
end
