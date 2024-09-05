class FormController < ApplicationController
  def new
    @form = Form.new
  end
  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    @form = Form.find(uesr[:id])
    @form.destroy
    redirect_to root_path
  end
  def index
    @forms = Form.all
  end
  private
  def form_params
    params.require(:form).permit(:firstname, :lastname, :birthdate, :gender, :email, :phonenumber, :subject)
  end
end
