shared_context 'logged in user' do
  let(:user) { create(:user, :with_profile) }

  before do
    sign_in user
  end
end
