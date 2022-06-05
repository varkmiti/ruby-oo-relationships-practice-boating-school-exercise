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

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end 

    def self.find_student(name)
        Student.all.select { |student| student.first_name == name }
    end 

    def grade_percentage
        BoatingTest.all.filter { |t| t.student == self && t.test_status == "passed"}.collect.count.to_f / BoatingTest.all.filter { |t| t.student == self}.collect.count
    end 
end
