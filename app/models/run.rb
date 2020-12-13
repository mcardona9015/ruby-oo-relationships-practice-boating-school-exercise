# require 'require_all'
# require_all 'models'
require 'pry'
require_relative 'boatingtest.rb'
require_relative 'instructor.rb'
require_relative 'student.rb'

mrspuff = Instructor.new("Mrs. Puff")
krabs= Instructor.new("Mr.Krabs")
spongebob = Student.new("Spongebob")
sandy = Student.new("Sandy Cheeks")
patrick= Student.new("Patrick")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", mrspuff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", mrspuff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
spongebob.add_boating_test("test 546", "failed", mrspuff)
spongebob.add_boating_test("test 547", "passed", mrspuff)
mrspuff.pass_student(sandy, "test 1")


binding.pry