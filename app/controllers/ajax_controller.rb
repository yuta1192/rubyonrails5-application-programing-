require 'net/http'

def upanel
  @time = Time.now.to_s
end

def search
  @books = Book.select(:publish).distinct
end

def result
  sleep(2)
  @books = Book.where(publish: params[:publish])
end

#def search_slide
  #api_key = 'xxxxxxxxx'
  #secret = 'xxxxxxxxx'
  #まだここ未実装
  #ts = Time.now.to_i
  #h = Digest::SHA1.hexdigest(secret + ts.to_s)
  #Net::HTTP.start('www.slideshare.net', 443,
  #  user_ssl: true, ca_file: 'tmp/cacert.pem') do |https|
  #  res = https.get("/api/2/search_slideshows?q=#{ERB::Util.url_encode(params[:keywd])}&lang=ja
&api?key=#{api_key}&hash=#{h}&ts=#{ts}")
  #  render json: Hash.from_xml(res.body).to_json
  #end
#end
