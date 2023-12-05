class String
  def is_number?
    true if Float(self) rescue false
  end
end

def check_if_gear(mat, i, j)
    i_range = 0..mat.length-1
    j_range = 0..mat[0].length-1

    moves = [-1, 0, 1]

    moves.each do |i_move|
        moves.each do |j_move|
            if i_move == 0 and j_move == 0
                next
            end

            curr_i = i + i_move
            curr_j = j + j_move

            if i_range.include?(curr_i) and j_range.include?(curr_j) and mat[curr_i][curr_j] == '*'
                return [curr_i, curr_j]
            end
        end
    end
   
    return false
end

mat = []

File.readlines('./test.txt', chomp: true).each do |line|
    arr = []

    line.each_char {
      |c| arr.push(c)
    }
    
    mat.push(arr)
end


is_part = false
curr_num = ''
gears = Hash.new([])

for i in (0...mat.length)
    for j in (0...mat[i].length)
        if mat[i][j].is_number?
            gear_idx = check_if_gear(mat, i, j)
            if gear_idx
                is_part = true
            end

            curr_num = curr_num + mat[i][j]

            if j == mat[i].length
                if is_part
                    gears[gear_idx] = gears[gear_idx].push(Integer(curr_num))
                end

                is_part = false
                curr_num = ''
            end
        elsif curr_num.length > 0 
            if is_part
                gears[gear_idx] = gears[gear_idx].push(Integer(curr_num))
            end

            is_part = false
            curr_num = ''
        end
    end
end

if curr_num.length > 0 and is_part
    gears[[mat.length-1, mat[0].length-1]].push(Integer(curr_num))
end

puts(gears)

