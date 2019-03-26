class HelloController < ApplicationController
  before_action :check_logined, only: :list

  def view
    @msg = 'こんにちは、世界！'
  end

  def list
    @books = Book.all
  end

  def app_var
    render plain: MY_APP['logo']['source']
  end

  private
    def check_logined
      if session[:user] then
        begin
          @user = User.find(session[:user])
        rescue ActiveRecord::RecordNotFound
          result_session
        end
      end

      unless @user
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end
end
