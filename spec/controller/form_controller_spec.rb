require 'rails_helper'

RSpec.describe FormController, type: :controller do
  describe 'GET #new' do
    it 'assigns a new Form to @form' do
      get :new
      expect(assigns(:form)).to be_a_new(Form)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new form and redirects to the root path' do
        valid_attributes = { form: { firstname: 'John', lastname: 'Doe', birthdate: '2000-01-01', gender: 'Male', email: 'john@example.com', phonenumber: '0987654321', subject: 'HTML' } }

        expect {
          post :create, params: valid_attributes
        }.to change(Form, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end

    # context 'with invalid attributes and referer is nil' do
    #   it 'does not save the new form and re-renders the new view' do
    #     invalid_attributes = { form: { firstname: '', lastname: '', birthdate: '', gender: '', email: '', phonenumber: '', subject: '' } }
    #     allow(request).to receive(:referer).and_return(nil)

    #     expect {
    #       post :create, params: invalid_attributes
    #     }.not_to change(Form, :count)

    #     expect(response).to render_template(:new)
    #     expect(response.status).to eq(422)
    #   end
    # end

    context 'with invalid attributes and referer includes root_path' do
      it 'renders turbo_stream response and re-renders the new_modal partial' do
        invalid_attributes = { form: { firstname: '', lastname: '', email: 'invalid' } }
        allow(request).to receive(:referer).and_return(root_path)

        post :create, params: invalid_attributes

        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include('new_modal')
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @form = Form.create(firstname: 'John', lastname: 'Doe', birthdate: '2000-01-01', gender: 'Male', email: 'john@example.com', phonenumber: '0987654321', subject: 'HTML')
    end

    it 'deletes the form and redirects to the root path' do
      expect {
        delete :destroy, params: { id: @form.id }
      }.to change(Form, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
