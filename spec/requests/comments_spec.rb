require 'rails_helper'

RSpec.describe "コメント機能", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:datespot) { create(:datespot) }
  let!(:comment) { create(:comment, user: user, datespot: datespot) }

  describe "コメント登録" do
    context "ログインしている場合" do
      before do
        login_for_request(user)
      end

      it "有効な内容のコメントが登録できること" do
        expect {
          post "/datespots/#{datespot.id}/comments", xhr: true, params: {
            datespot_id: datespot.id,
            comment: { content: "オシャレですね！", rate: 5 }
          }
        }.to change(datespot.comments, :count).by(1)
      end

      it "無効な内容のコメントが登録できないこと" do
        expect {
          post "/datespots/#{datespot.id}/comments", xhr: true, params: {
            datespot_id: datespot.id,
            comment: { content: "", rate: 5 }
          }
        }.not_to change(datespot.comments, :count)
      end
    end

    context "ログインしていない場合" do
      it "コメントは登録できず、ログインページへリダイレクトすること" do
        expect {
          post "/datespots/#{datespot.id}/comments", xhr: true, params: {
            datespot_id: datespot.id,
            comment: { content: "オシャレですね！", rate: 5 }
          }
        }.not_to change(datespot.comments, :count)
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "コメント削除" do
    context "ログインしている場合" do
      context "コメントを作成したユーザーである場合" do
        it "コメントの削除ができること" do
          login_for_request(user)
          expect {
            delete "/datespots/#{datespot.id}/comments/#{comment.id}", xhr: true
          }.to change(datespot.comments, :count).by(-1)
        end
      end

      context "コメントを作成したユーザーでない場合" do
        it "コメントの削除はできないこと" do
          login_for_request(other_user)
          expect {
            delete "/datespots/#{datespot.id}/comments/#{comment.id}", xhr: true
          }.not_to change(datespot.comments, :count)
        end
      end
    end

    context "ログインしていない場合" do
      it "コメントの削除はできず、ログインページへリダイレクトすること" do
        expect {
          delete "/datespots/#{datespot.id}/comments/#{comment.id}", xhr: true
        }.not_to change(datespot.comments, :count)
        expect(response).to redirect_to login_path
      end
    end
  end
end
