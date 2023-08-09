class EducationsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render status: 200, json: Education.all }
    end
  end

  def show
    respond_to do |format|
      format.json { render status: 200, json: @education }
    end
  end

  def create
    @education = Education.create(education_params)
    respond_to do |format|
      if @education.errors.blank?
        format.json { render status: 200, json: @education }
      else
        format.json { render status: 400, json: { message: @education.errors.full_messages } }
      end
    end
  end

  def update
    respond_to do |format|
      if @education.update(education_params)
        format.json { render status: 200, json: @education }
      else
        format.json { render status: 400, json: { message: @education.errors.full_messages } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @education.destroy
        format.json { render status: 200, json: @education }
      else
        format.json { render status: 400, json: { message: @education.errors.full_messages } }
      end
    end
  end

  private

  def set_education
    @education = Education.find_by(id: params[:id])

    return if @education.present?

    respond_to do |format|
      format.json { render status: 400, json: :no_exist }
    end
  end

  def education_params
    params.permit(:name)
  end
end
