def group_by_marks(marks, pass_marks)
    return marks.group_by { |key,value| value > pass_marks ? "Passed" : "Failed" }
end
