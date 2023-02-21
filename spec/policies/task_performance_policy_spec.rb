describe TaskPerformancePolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:assignee) { create(:user) }
  let(:task) { create(:task, user:, assignee:) }
  let(:task_performance) { build(:task_performance, task:) }

  permissions :complete? do
    it 'denies access if a user is not assigned to a task' do
      expect(subject).not_to permit(user, task_performance)
    end

    it 'grants access if a user is assigned to a task' do
      expect(subject).to permit(assignee, task_performance)
    end
  end
end
