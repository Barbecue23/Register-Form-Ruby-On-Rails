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
    if @form.destroy
      redirect_to form_index_path
    else
      redirect_to form_index_path, alert: "Something went wrong"
    end
    def confirm_destroy
      @form = Form.find(params[:id])
      redirect_to confirm_destroy_form_path
    end
  end
  def index
    @column = params[:sort_by]
    @direction = params[:direction]

    @forms = Form.all

    if @column.present?
      @forms = @forms.order("#{@column} #{@direction}")
    end
  end
  private
  def form_params
    params.require(:form).permit(:firstname, :lastname, :birthdate, :gender, :email, :phonenumber, :subject)
  end
end
