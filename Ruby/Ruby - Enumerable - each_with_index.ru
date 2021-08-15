def skip_animals(animals, skip)
    # Your code here
    # return animals.each_with_index { |item, index| animals if index >= skip }
    # puts animals.each_with_index { |item, index| animals if index >= 5 }
    # puts "animals = #{animals}, skip = #{skip}"
    a = []
    animals.each_with_index do | element, index |
        if index >= skip
            a.append("#{index}:#{element}")
            # puts "#{index}:#{element}"
            # puts "#{element} is number #{index} in the array"
        end
        # puts "#{element} is number #{index} in the array"
    end
    return a
end