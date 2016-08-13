def shuffle_file
  puts "Please enter a file name."
  file_name = gets.chomp
  file_text = []
  File.foreach (file_name) {|line| file_text << line}
  file_text.shuffle!

  File.open("#{file_name}-shuffled.txt","w+") do
   |f| file_text.each{|element| f.puts(element)}
  end
end

shuffle_file
