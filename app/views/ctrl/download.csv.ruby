require 'kconv'
result = ''

result << @books.attribute_name.join(',')
result << "\r"

@books.each do |b|
  result << b.attributes.values.join(',')
  result << "\r"
end

result.kconv(Kconv::SJIS, Kconv::UTF8)
