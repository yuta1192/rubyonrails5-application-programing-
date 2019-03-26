class CtrlController < applicationController
  before_action :start_logger, only: [:index, :index2]
  after_action :end_logger, except: :index
  around_action :around_logger
  skip_before_action :my_loggeing, only: :index

def para
  render plain: 'idパラメーター：' + params[:id]
end

def para_array
  render plain: 'categoryパラメーター：' + params[:category].inspect
end

def req_head
  render plain: request.headers['User-Agent']
end

def req_head2
  @headers = request.headers
end

def upload_process
  file = params[:upfile]
  name = file.original_filename
  perms = ['.jpg', '.jpeg', '.gif', '.png']
  if !perms.include?(File.extname(name).downcase)
    result = 'アップロードできるのは画像ファイルのみです。'
  elsif file.size > 1.megabyte
    result = 'ファイルサイズは1MBまでです。'
  else
    File.open("public/docs/#{name}", 'wb') {|f| f.write(file.read) }
    result = "#{name}をアップロードしました。"
  end
  render plain: result
end

def updb
  @author = Author.find(params[:id])
end

def updb_process
  @author = Author.find(params[:id])
  if @author.update(params.require(:author).permit(:data))
    render plain: '保存に成功しました。'
  else
    render plain: @author.errors.full_messages[0]
  end
end

def show_photo
  id = params[:id] ? params[:id] : 1
  @author = Author.find(id)
  send_data @author.photo, type: @author.ctype, disposition: :inline
end

def log
  logger.unknown('unknown')
  logger.fatal('fatal')
  logger.error('error')
  logger.warn('warn')
  logger.info('info')
  logger.debug('debug')
  render plain: 'ログはコンソール、またはログファイルから確認ください。'
end

def get_xml
  @books = Book.all
  render xml: @books
end

def get_json
  @books = Book.all
  render json: @books
end

def download
  @books = Book.all
end

def cookie
  @email = cookies[:email]
end

def cookie_rec
  cookies[:email] = { value: params[:email],
    expires: 3.months.from_now, http_only: true }
  render plain: 'クッキーを保存しました。'
end

def session_show
  @email = session[:email]
end

def session_rec
  session[:email] = params[:email]
  render plain: 'セッションを保存しました。'
end

def index
  sleep 3
  render plain: 'indexアクションが実行されました。'
end

private
  def start_logger
    logger.debug('[Start]' + Time.now.to_s)
  end

  def end_logger
    logger.debug('[Finish]' + Time.now.to_s)
  end

  def around_logger
    logger.debug('[Start]' + Time.now.to_s)
    yield
    logger.debug('[Start]' + Time.now.to_s)
  end

  def auth
    name = 'yyamada'
    passwd = 'irepowfkfdoskfoprwer3230kfod'
    authenticate_or_request_with_http_basic('Railsbook') do |n, p|
      n == name && Digest::SHA1.hexdigest(p) == passwd
    end
  end
end
