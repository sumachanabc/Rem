require 'rails_helper'

RSpec.describe "Documents", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/documents/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/documents/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/documents/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/documents/create"
      expect(response).to have_http_status(:success)
    end
  end

end
