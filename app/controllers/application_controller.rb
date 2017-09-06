class ApplicationController < ActionController::API

  def not_found(status = 404, message = 'Not found')
    return render json: {error: message}, status: status
  end
end
