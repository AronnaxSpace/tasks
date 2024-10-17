describe '/projects', type: :request do
  include_context 'logged in user'

  let(:project) { create(:project, owner: user, name: 'Project Name') }

  describe 'GET /index' do
    it 'renders a successful response' do
      get projects_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:valid_attributes) { attributes_for(:project) }
    let(:invalid_attributes) { attributes_for(:project, name: nil) }

    context 'with valid parameters' do
      it 'creates a new project' do
        expect do
          post projects_url, params: { project: valid_attributes }
        end.to change(user.projects, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new project' do
        expect do
          post projects_url, params: { project: invalid_attributes }
        end.to change(Project, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'New Project Name'
        }
      end

      it 'updates the requested project' do
        expect do
          patch project_url(project), params: { project: new_attributes }
        end.to change { project.reload.name }.from('Project Name').to('New Project Name')
      end
    end
  end

  describe 'DELETE /destroy' do
    before { project }

    it 'destroys the requested project' do
      expect do
        delete project_url(project)
      end.to change(Project, :count).by(-1)
    end
  end
end
