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

  def update
    run Thing::Update do |result|
      return render json: @model
    end

    render json: @form
  end

  def destroy
    run Thing::Delete do |result|
      return head :ok
    end

    not_found
  end
end
