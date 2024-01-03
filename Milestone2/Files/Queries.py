import Configuration
from Configuration import *
import datetime
import time

def Query_1(student_id , quiz_id):
    """
    :param student_id:
    :param quiz_id:
    :return:
    A list With Required Data to be Extraxted
    0 --> How many Trials used From this user ID to This Quiz
    1 --> Number of Trials for a Quiz as a limit
    2 --> How many trials left can the User use
    3 --> Trails of The user --> 0 : Date of Trail , 1 : Score of the Trail
    """
    cnx = Configuration.cnx
    cursor = cnx.cursor()
    my_list= []
    trials_used = []
    # ------------- students ----------------------
    Student_cursor = cnx.cursor()
    Student_cursor.execute("Select * from student")
    students_data = Student_cursor.fetchall()

    #------------------ Quiz ---------------------
    Quiz_cursor = cnx.cursor()
    Quiz_cursor.execute('Select * from quiz ;')
    Quizes_data = Quiz_cursor.fetchall()

    #-----------------Trials----------------------
    Trials_cursor = cnx.cursor()
    Trials_cursor.execute('Select * from quiz_trials ;')
    Trials_data = Trials_cursor.fetchall()

    for student in students_data :
        for trial in Trials_data:
            for quiz in Quizes_data:
                if student[0] == trial[1] and quiz[0] == trial[2] :
                    my_list.append([student[0] , quiz[0]])

    trials_count = 0
    for element in my_list:
        if element == [student_id, quiz_id]:
            trials_count += 1
    for trail in Trials_data :
        if student_id== trail[1] and quiz_id == trail[2]:
            dt = trail[3]
            stripped_tuple = tuple(dt.timetuple())[:5]
            date_obj = datetime.datetime(*stripped_tuple)
            date_str = date_obj.strftime('%Y-%m-%d')
            trials_used.append([date_str, trail[4]])


    quiz_limit = 0
    for quiz in Quizes_data :
        if quiz[0] == quiz_id :
            quiz_limit = quiz[1]
        else :
            pass
    allowed_trials_number = quiz_limit - trials_count
    return_data = [trials_count ,quiz_limit  , allowed_trials_number , trials_used]
    return return_data

def Query2(Student_id , Instructor_id):
    """
    :param Student_id:
    :param Instructor_id:
    :return:
    A list of all discussions that are in the courses that are givimg by the same Instructor:
    0 --> The Title
    1 --> The Date
    2 --> The Content
    """
    return_data = []
    cnx = Configuration.cnx
    cursor = cnx.cursor()
    # Execute the SQL query
    query = '''
        SELECT title, date, content
        FROM discussions d
        JOIN courses c ON d.course_id = c.id
        WHERE c.instructor_id = %s
            AND EXISTS (
            SELECT 1
            FROM enrollments e
            WHERE e.student_id = %s
            AND e.course_id = c.id
        )
    '''
    params = (Instructor_id, Student_id)
    cursor.execute(query, params)

    # Fetch the results
    results = cursor.fetchall()

    # Print the results
    for result in results:
        dt = result[1]
        stripped_tuple = tuple(dt.timetuple())[:5]
        date_obj = datetime.datetime(*stripped_tuple)
        date_str = date_obj.strftime('%Y-%m-%d')
        return_data.append([result[0],date_str,result[2]])
    # Close the database connection
    return return_data

def Query3(Course_name):
    """
    :param Course_name:
    :return:
    A list of Names for the people who gives the same Course
    """
    return_data = []
    cnx = Configuration.cnx
    cursor = cnx.cursor()
    # Execute the SQL query
    query = "SELECT Distinct c.name, i.name FROM courses c JOIN instructors i ON c.instructor_id = i.id WHERE c.name = %s "
    course_name = (f"{Course_name}",)
    cursor.execute(query, course_name )

    # Fetch the results
    results = cursor.fetchall()

    # Print the results
    for result in results:
        return_data.append(result[1])
    return return_data

def Query4(course_name, enrollment_date ) :
    """
    :return: List of all student that enrolled in the same time for the same course
    """
    cnx = Configuration.cnx
    cursor = cnx.cursor()

    query = "SELECT Distinct s.name, e.enrollment_date FROM student s JOIN enrollments e ON s.id = e.student_id JOIN courses c ON e.course_id = c.id WHERE c.name = %s AND e.enrollment_date = %s"
    mycursor = cnx.cursor()
    mycursor.execute(query, (course_name, enrollment_date))
    results = mycursor.fetchall()
    return results

def Query5(student_id, instructor_id) :
    """
    :param student_id:
    :param course_name:
    :return:
    List Contains e resources of a course only when user is enrolled course
    resource_id, resource_name, resource_url, course_id, instructor_id
    """
    return_data = []
    mydb = Configuration.cnx

    # Define the SQL query
    query =  """
    SELECT Distinct r.*
    FROM resources r
    JOIN courses c ON r.course_id = c.id
    JOIN enrollments e ON c.id = e.course_id AND e.student_id = %s
    JOIN classes cl ON c.id = cl.course_id AND cl.instructor_id = %s
    """
    mycursor = mydb.cursor()
    mycursor.execute(query, (student_id, instructor_id))
    results = mycursor.fetchall()
    return results


import mysql.connector
def Database_Update_after_submittion(assignment_id , student_id):
    Query= "UPDATE assignments SET submitted = true WHERE assignment_id = %a AND EXISTS (SELECT * FROM submissions WHERE submissions.assignment_id = assignments.assignment_id AND submissions.student_id = %2 );"
    mydb = Configuration.cnx

    # Define the SQL query
    query = "SELECT r.resource_name,r.resource_url FROM resources r jOIN courses c ON r.course_id = c.id JOIN instructors i ON c.instructor_id = i.id JOIN enrollments e ON c.id = e.course_id WHERE e.student_id = %s AND c.name = %s;"
    mycursor = mydb.cursor()
    mycursor.execute(query, (assignment_id, student_id))


def Query6(course_id):
    #submission_id, assignment_id, student_id, submission_date, submission_file, grade, feedback, course_name
    cnx = Configuration.cnx
    cursor = cnx.cursor()
    query = """
    SELECT s.*, c.name AS course_name
FROM submissions s
JOIN assignments a ON s.assignment_id = a.assignment_id
JOIN courses c ON a.course_id = c.id
WHERE c.id = %s
    """
    cursor.execute(query ,[course_id] )
    results = cursor.fetchall()
    return results

def Query7(course_id):
    return_data = []
    cnx = Configuration.cnx
    # Create a cursor object
    cursor = cnx.cursor()

    # Define the SQL query
    query = """
    SELECT COUNT(*) AS num_students
    FROM enrollments
    JOIN courses ON enrollments.course_id = courses.id
    WHERE courses.id = %s ;
    """

    # Execute the SQL query and fetch the result
    cursor.execute(query,[course_id])
    result = cursor.fetchone()

    # Print the result to the console
    if result:
        num_students = result[0]

    # Close the cursor and the database connection

    return num_students

def Query8(student_id , assignment_id):
    #assignment_title, grade, feedback
  # Establish a connection to the MySQL database
  cnx = Configuration.cnx


  # Create a cursor object
  cursor = cnx.cursor()
  # Define the SQL query
  query = """
  SELECT a.assignment_title, s.grade, s.feedback
    FROM submissions s
    INNER JOIN assignments a ON s.assignment_id = a.assignment_id
    WHERE s.student_id = %s AND a.assignment_id = %s AND s.grade IS NOT NULL;;
  """

  # Execute the SQL query and fetch the result
  cursor.execute(query, (assignment_id, student_id))
  result = cursor.fetchall()
  return result



def Query9(instructor_id):
    #instructor_name, num_courses
  cnx = Configuration.cnx


  # Create a cursor object
  cursor = cnx.cursor()
  # Define the SQL query
  query = """
  SELECT instructors.name AS instructor_name, COUNT(DISTINCT courses.id) AS num_courses
    FROM courses
    INNER JOIN instructors ON courses.instructor_id = instructors.id
    where instructors.id = %s
    GROUP BY instructors.id;
  """

  # Execute the SQL query and fetch the result
  cursor.execute(query, [instructor_id])
  result = cursor.fetchall()

  return result[0]
  # Print the result to the console


def Query10(course_id):
  cnx = Configuration.cnx
  cursor = cnx.cursor()
  query = """
  SELECT COUNT(*) AS num_waiting
    FROM enrollments
    WHERE course_id = %s AND status = 'waiting';
  """
  cursor.execute(query ,[course_id])
  result = cursor.fetchone()
  if result:
      num_waiting = result[0]

  return num_waiting

def Query11(years):
    retuen_data=  []
    mydb = Configuration.cnx

    mycursor = mydb.cursor()
    Query = """
    SELECT  student.id,  student.name,  enrollments.enrollment_date, DATEDIFF(CURDATE(), enrollments.enrollment_date) / 365 AS years_enrolled
    FROM student
    INNER JOIN enrollments ON student.id = enrollments.student_id
    WHERE DATEDIFF(CURDATE(), enrollments.enrollment_date) / 365 > %s;
    """
    mycursor.execute(Query , [years] )

    myresult = mycursor.fetchall()
    for row in myresult:
        retuen_data.append([row[0], row[1]])
    return retuen_data

def Query12(grade) :
    return_data = []
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    Query = """
        SELECT student.id, student.name, courses.name AS course_name, certificates.grade
        FROM student
        INNER JOIN certificates ON student.id = certificates.enrollment_id
        INNER JOIN courses ON certificates.course_id = courses.id
        WHERE certificates.grade > %s;
        """
    mycursor.execute(Query, [grade])
    results = mycursor.fetchall()
    for result in results :
        return_data.append([result[0],result[1]])

    return return_data

def Query13():
  return_data = []
  cnx = Configuration.cnx
  cursor = cnx.cursor()
  query = """
    SELECT courses.name AS course_name, schedules.schedule_day, schedules.schedule_time, instructors.name AS instructor_name
    FROM courses
    INNER JOIN instructors ON courses.instructor_id = instructors.id
    INNER JOIN schedules ON courses.schedule_id = schedules.schedule_id;
    """
  cursor.execute(query)
  result = cursor.fetchall()
  return result

def Query14(start_date, end_date):
  cnx = Configuration.cnx
  cursor = cnx.cursor()
  query = """
    SELECT COUNT(*) AS total_students
    FROM graduations
    WHERE graduation_date BETWEEN %s AND %s
  """
  cursor.execute(query, [start_date, end_date])
  results = cursor.fetchall()
  return results

def Query15():
    Query = """
    SELECT DISTINCT name, requirments 
    FROM courses;
    """
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    mycursor.execute(Query)
    results = mycursor.fetchall()
    return results

def Query16( course_id , enrollment_date):
    Query = """
    SELECT student.id, student.name, enrollments.enrollment_date
    FROM student
    INNER JOIN enrollments ON student.id = enrollments.student_id
    WHERE enrollments.course_id = %s AND enrollments.enrollment_date >= %s ;
    """
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    mycursor.execute(Query, (course_id , enrollment_date))
    results = mycursor.fetchall()
    return results

def Query17( Grade , course_name ):
    Query = """
    SELECT courses.name AS course_name, certificates.grade, student.name AS student_name
    FROM certificates
    INNER JOIN courses ON certificates.course_id = courses.id
    INNER JOIN student ON certificates.enrollment_id = student.id
    WHERE certificates.grade >= %s and courses.name = %s ;
    """
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    mycursor.execute(Query, (Grade , course_name))
    results = mycursor.fetchall()
    return results

def Query19(student_id, course_id):
    Query = """SELECT COUNT(*) FROM enrollments WHERE student_id = %s AND course_id = %s AND status = 'Dropped' """
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    mycursor.execute(Query, (student_id, course_id))
    results = mycursor.fetchall()
    return results

def Query20(course_id, instructor_id , count):
    Query = """SELECT COUNT(*) AS num_students
    FROM enrollments
    JOIN classes ON enrollments.class_id = classes.id
    JOIN student ON enrollments.student_id = student.id
    JOIN attendance ON enrollments.enrollment_id = attendance.enrollment_id
    WHERE classes.course_id = %s AND classes.instructor_id = %s
    GROUP BY enrollments.student_id
    HAVING COUNT(*) < %s
    """
    mydb = Configuration.cnx
    mycursor = mydb.cursor()
    mycursor.execute(Query, (course_id, instructor_id , count))
    results = mycursor.fetchall()
    return results


