describe ProjectPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:owner) { create(:user) }
  let(:project) { create(:project, owner:) }

  permissions :show? do
    it 'denies access if a user is not a project user' do
      expect(subject).not_to permit(user, project)
    end

    context 'when a user is a project user' do
      before { project.users << user }

      it 'grants access' do
        expect(subject).to permit(user, project)
        expect(subject).to permit(owner, project)
      end
    end
  end

  permissions :update?, :destroy? do
    it 'denies access if a user is not a project user' do
      expect(subject).not_to permit(user, project)
    end

    context 'when a user is not a project owner' do
      before { project.users << user }

      it 'denies access' do
        expect(subject).not_to permit(user, project)
      end
    end

    it 'grants access if a user is a project owner' do
      expect(subject).to permit(owner, project)
    end
  end
end
