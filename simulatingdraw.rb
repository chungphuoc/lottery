class Person
	@name = ""
	@grade = ""
	@new_grade = ""
	@letter_grade = ""

	def initialize(n, g)
		@name = n
		@grade = g
	end

	def get_old_grade()
		return @grade
	end

	def calculateGrade(max)
		@new_grade = @grade * 100 / max
		if @new_grade > 90
			@letter_grade = "A"
		elsif @new_grade > 80
			@letter_grade = "B"
		elsif @new_grade > 70
			@letter_grade = "C"
		elsif @new_grade > 60
			@letter_grade = "D"
		elsif @new_grade > 49
			@letter_grade = "E"
		else
			@letter_grade = "F"
		end
	end

	def shows()
		return @name + "\t" + @new_grade.to_s + "\t" + @grade.to_s + "\t" + @letter_grade
	end
end

max = 0

allStudent = Array.new()

file = File.open("exam_results.txt")
for line in file
	a = line.split(",")
	p = Person.new(a[0], a[1].to_i)
	allStudent << p
end

file.close

File.delete(file)

output = File.new("exam_results.txt", "w+")

for x in allStudent
	if x.get_old_grade() > max
		max = x.get_old_grade()
	end
end

for x in allStudent
	x.calculateGrade(max)
	output.puts
	x.shows()
end
