# Nested Lists.py

# Given the names and grades for each student in a Physics class of N students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.

marksheet = []
for _ in range(0,int(input())):
    marksheet.append([raw_input(), float(raw_input())])

second_highest = sorted(list(set([marks for name, marks in marksheet])))[1]
print "second_highest = ", second_highest
print('\n'.join([a for a,b in sorted(marksheet) if b == second_highest]))
