mat = []

File.readlines('./test.txt', chomp: true).each do |line|
    arr = []

    line.each_char {
      |c| arr.push(c)
    }
    
    puts(arr.length)
    mat.push(arr)
end



for i in (0...mat.length)
  for j in (0...mat[i].length)
    
  end
end

