require 'pry'

# require 'require_all'
# require_all 'models'

class Student

attr_reader :first_name

@@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def all_instructors
        BoatingTest.all.map(&:instructor).uniq
    end

    def self.find_student(name)
        self.all.find {|student| student.first_name == name}
    end

    def grade_percentage
        total_tests = 0.0
        passed_tests = 0.0
        BoatingTest.all.each do |test|
            if test.student == self
                total_tests += 1
                if test.boating_test_status == 'passed'
                    passed_tests += 1
                end 
            end
        end
        if passed_tests > 0
            return (passed_tests / total_tests)*100
        else
            0
        end
        
    end
end



# binding.pry