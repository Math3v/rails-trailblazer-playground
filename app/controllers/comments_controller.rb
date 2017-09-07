class CommentsController < ApplicationController
  def create
    run Comment::Create do |result|
      return render json: @model
    end

    render json: @form
  end
end
