# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.

class Student
  attr_reader :first_name, :last_name, :name, :courses

  def initialize(first, last)
    @first_name = first
    @last_name = last
    @name = "#{@first_name} #{@last_name}"
    @courses = []
  end

  def enroll(course = nil)
    # raise "course would cause conflict!" if course_conflict?(course)
    # raise "already enrolled" if @courses.include? course
    unless @courses.include? course
      @courses << course
      course.students << self
  end
  end

  # #NOT FINISHED
  def course_conflict?(_course2)
    @courses
    # nested while loop
  end

  def course_load
    depts = {}
    # store or sum the number of credits for each course's department
    @courses.each { |c| depts[c.department] = (depts[c.department] || 0) + c.credits }
    depts
  end
end
