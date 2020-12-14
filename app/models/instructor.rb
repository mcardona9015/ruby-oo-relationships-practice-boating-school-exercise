require 'pry'
# require 'require_all'
# require_all 'models'

class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def passed_students
        BoatingTest.all.select {|all_test|all_test.instructor == self}.select {|test|test.boating_test_status == "passed"}.map(&:student)
    end

    def pass_student(student, test_name)
        student_test = nil
        BoatingTest.all.each do |test|
            if test.student == student and test.boating_test_name == test_name
                test.boating_test_status = "passed"
                student_test = test
            end
        end
        if student_test == nil
            student_test = BoatingTest.new(student, test_name, "passed", self)
        end
        student_test
    end
    
    def fail_student
        student_test = nil
        BoatingTest.all.each do |test|
            if test.student == student and test.boating_test_name == test_name
                test.boating_test_status = "failed"
                student_test = test
            end
        end
        if student_test == nil
            student_test = BoatingTest.new(student, test_name, "failed", self)
        end
        student_test
    end

    def all_students
        BoatingTest.all.select {|test|test.instructor == self}.map(&:student).uniq
    end



end

# binding.pry