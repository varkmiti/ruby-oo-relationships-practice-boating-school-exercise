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
 
    def passed_student 
        BoatingTest.all.filter { |test| test.instructor == self && test.test_status == "passed" }.collect { |test| test.student }
    end 

    def pass_student(student, test_name)
        if BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect != []
            BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect.each { |t| t.test_status = "passed" } 
        elsif BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect == []
            BoatingTest.new(student, test_name, "passed", self)
        end
    end  

    def fail_student(student, test_name)
        if BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect != []
            BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect.each { |t| t.test_status = "failed" } 
        elsif BoatingTest.all.filter { |test| test.student == student && test.test_name == test_name }.collect == []
            BoatingTest.new(student, test_name, "failed", self)
        end
    end  

end
