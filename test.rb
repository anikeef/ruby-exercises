files = Dir.glob("#{Dir.pwd}/*")

info =
  files.inject({}) do |result, file|
    extension = /\.(.+)\Z/i.match(file)[1]
    result[extension] ||= {count: 0, bytes: 0}
    result[extension][:count] += 1
    result[extension][:bytes] += File.size(file)
    result
  end

File.open("info.txt", "w") do |file|
  file.puts "Filetype   Count   Bytes"
  info.each do |extension, properties|
    file.puts "#{extension.upcase}   #{properties[:count]}   #{properties[:bytes]}"
  end
end
