class LoginController < ApplivationConstroller
  skip_before_action :check_logined
  def auth
    usr = User.find_by(username: params[:username])
    if usr && user.authenticate(params[:password]) then
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名/パスワードが間違っています。'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect to '/'
  end
end