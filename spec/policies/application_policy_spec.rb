require 'rails_helper'

describe ApplicationPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:assignee) { create(:user) }
  let(:task) { create(:task, user:, assignee:) }

  permissions :destroy? do
    it 'denies access if a task does not belong to a user' do
      expect(subject).not_to permit(assignee, task)
    end

    it 'grants access if a task belongs to a user' do
      expect(subject).to permit(user, task)
    end
  end
end
