require 'rails_helper'

RSpec.describe AuthController, type: :controller do

  describe "POST #create" do
    before { post :create, params: user_params }

    subject { JSON.parse(response.body) }

    context 'with read permission' do
      let(:user_params) do
        { user: 'normal_user' }
      end

      it { is_expected.to include 'group' => 'common' }
      it { expect(response).to have_http_status(:success) }
    end

    context 'with full permission' do
      let(:user_params) do
        { user: 'admin' }
      end

      it { is_expected.to include 'group' => 'financial' }
      it { expect(response).to have_http_status(:success) }
    end
  end

end
