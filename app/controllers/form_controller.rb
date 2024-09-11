class FormController < ApplicationController
  def new
    @form = Form.new
  end
  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to root_path
    else
      render :new , status: :unprocessable_entity
    end
  end
  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
      format.turbo_stream
    end
  end
  def index
    @forms = Form.all
  end
  private
  def form_params
    params.require(:form).permit(:firstname, :lastname, :birthdate, :gender, :email, :phonenumber, :subject)
  end
end
