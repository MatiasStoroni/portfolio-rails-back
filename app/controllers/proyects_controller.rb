class ProyectsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render status: 200, json: Proyect.all }
    end
  end

  def show
    respond_to do |format|
      format.json { render status: 200, json: @proyect }
    end
  end

  def create
    @proyect = Proyect.create(proyect_params)
    respond_to do |format|
      if @proyect.errors.blank?
        format.json { render status: 200, json: @proyect }
      else
        format.json { render status: 400, json: { message: @proyect.errors.full_messages } }
      end
    end
  end

  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.json { render status: 200, json: @proyect }
      else
        format.json { render status: 400, json: { message: @proyect.errors.full_messages } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @proyect.destroy
        format.json { render status: 200, json: @proyect }
      else
        format.json { render status: 400, json: { message: @proyect.errors.full_messages } }
      end
    end
  end

  private

  def set_proyect
    @proyect = Proyect.find_by(id: params[:id])

    return if @proyect.present?

    respond_to do |format|
      format.json { render status: 400, json: :no_exist }
    end
  end

  def proyect_params
    params.permit(:name)
  end
end
