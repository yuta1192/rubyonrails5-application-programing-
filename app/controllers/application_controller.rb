class ApplicationController < ActionController::Base
  add_flash_types :info
  protect_from_forgery with: :exception
  before_action :check_logined
  rescue_from ActiveRecord::RecordNotFound, with: :id_invalid
  before_action :detect_device

  private
    def check_logined
    end

    def in_valid(e)
      render 'shared/record_not_found', status: 404
    end

    def detect_device
      case params[:type]
        when 'mobile'
          request.variant = :mobile
        when 'tablet'
          request.variant = :table
        end
      end
    end
end
