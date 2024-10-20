describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:assignee).class_name('User').with_foreign_key('assignee_id').optional }
    it { is_expected.to belong_to(:project).optional }
    it { is_expected.to belong_to(:task_set).optional }
    it { is_expected.to have_many(:performances).class_name('TaskPerformance').dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
