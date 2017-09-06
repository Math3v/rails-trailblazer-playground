class ThingsController < ApplicationController
  def create
    run Thing::Create do |result|
      return render json: @model
    end
    
    render json: @form
  end

  def show
    run Thing::Show do |result|
      return render json: @model
    end

    not_found
  end
end
