class ExperiencesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render status: 200, json: Experience.all }
    end
  end

  def show
    respond_to do |format|
      format.json { render status: 200, json: @experience }
    end
  end

  def create
    @experience = Experience.create(experience_params)
    respond_to do |format|
      if @experience.errors.blank?
        format.json { render status: 200, json: @experience }
      else
        format.json { render status: 400, json: { message: @experience.errors.full_messages } }
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.json { render status: 200, json: @experience }
      else
        format.json { render status: 400, json: { message: @experience.errors.full_messages } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @experience.destroy
        format.json { render status: 200, json: @experience }
      else
        format.json { render status: 400, json: { message: @experience.errors.full_messages } }
      end
    end
  end

  private

  def set_experience
    @experience = Experience.find_by(id: params[:id])

    return if @experience.present?

    respond_to do |format|
      format.json { render status: 400, json: :no_exist }
    end
  end

  def experience_params
    params.permit(:name)
  end
end
