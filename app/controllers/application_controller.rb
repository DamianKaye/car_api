class ApplicationController < ActionController::API

  rescue_from ApiError::BadRequestError, with: :bad_request

  def api_error(status: 500, errors: "Something went wrong")
    head status: status and return if errors.empty?

    render json: { errors: errors }.to_json, status: status
  end

  private

  def bad_request
     api_error status: 400, errors: 'Bad Request'
  end

end
