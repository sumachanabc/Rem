require 'rails_helper'

RSpec.describe "CondoUsers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/condo_users/index"
      expect(response).to have_http_status(:success)
    end
  end

end
