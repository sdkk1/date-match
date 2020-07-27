require "rails_helper"

RSpec.describe "プロフィール編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get edit_user_path(user)
      expect(response).to render_template('users/edit')
      patch user_path(user), params: { user: {
        name: "Example User",
        email: "user@example.com",
        password: "",
        password_confirmation: ""
      } }
      redirect_to user
      follow_redirect!
      expect(response).to render_template('users/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get edit_user_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path

      patch user_path(user), params: { user: {
        name: user.name,
        email: user.email
      } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      login_for_request(other_user)
      get edit_user_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path

      patch user_path(user), params: { user: {
        name: user.name,
        email: user.email
      } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end
