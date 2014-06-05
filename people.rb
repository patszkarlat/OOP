class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi! My name is #{@name}!"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object."
	end
end

instance1 = Instructor.new("Chris")
instance2 = Student.new("Christina")

instance1.greeting
instance2.greeting

instance1.teach
instance2.learn

instance2.teach
#this doesn't work because student does not have the def 'teach', only instructor does.


