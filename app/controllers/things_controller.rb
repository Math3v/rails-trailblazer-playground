class ThingsController < ApplicationController
  def create
    run Thing::Create do |result|
      return render json: @model
    end
    
    render json: @form
  end
end
