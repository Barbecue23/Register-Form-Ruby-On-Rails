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
    redirect_to root_path
  end

  def confirm_destroy
    @form = Form.find(params[:id])
    render turbo_stream: turbo_stream.replace("modal", partial: "confirm_destroy", locals: { kiw: @form })
  end
  def new_modal
    @form = Form.new
    render turbo_stream: turbo_stream.replace("modal", partial: "new_modal", locals: { form: @form })
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
