require 'rails_helper'

RSpec.describe "CondoUserPosts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/condo_user_posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/condo_user_posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/condo_user_posts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
