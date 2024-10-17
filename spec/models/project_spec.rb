describe Project, type: :model do
  subject { build(:project, owner: user) }

  let(:user) { create(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end

  it 'makes code uppercase' do
    subject.code = 'abc'
    subject.save

    expect(subject.code).to eq 'ABC'
  end

  it 'makes owner a project user' do
    subject.save

    expect(subject.users).to include user
  end
end
