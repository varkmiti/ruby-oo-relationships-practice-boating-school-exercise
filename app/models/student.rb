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

    def add_boating_test(student, test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end 

    def self.find_student(name)
        Student.all.select { |student| student.first_name == name }
    end 

end
