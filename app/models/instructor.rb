class Instructor

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all
        @@all
    end 

    def all_students
        BoatingTest.all.filter { |test| test.instructor == self }.collect { |test| test.student }
    end 

    end 
    def passed_student 
        BoatingTest.all.filter { |test| test.instructor == self && test.test_status == "passed" }.collect { |test| test.student }
    end 
end
