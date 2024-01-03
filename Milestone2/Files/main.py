import discord
from discord.ext import commands
import Queries
from Queries import *
from Configuration import data_limit_mb

intents = discord.Intents.all()
intents.members = True
client = commands.Bot(command_prefix='/', intents=intents)



@client.command()
async def view_quiz_attempts_dates_results(ctx,arg1 ,arg2):
    data = Query_1(int(arg1) ,int(arg2))
    Trials = data[3]
    await ctx.send(f"Trials Used = {data[0]}\n"
                   f"Trials Limit = {data[1]}\n"
                   f"Trials left = {data[2]}\n"
                   f"Trials Of the User =\n")
    for i in range(len(Trials)):
        await ctx.send(f"Trial {i+1} :\n     Date={Trials[i][0]}\n     Score={Trials[i][1]}\n"
                       f"-----------------------------------------------")

@client.command()
async def view_discussion_in_course(ctx,Student_id , Instructor_id):
    data = Query2(int(Student_id) ,int(Instructor_id))
    for i in range(len(data)):
        await ctx.send(f'Discussion{i + 1}: \n'
                       f'   Title = {data[i][0]}\n'
                       f'   Date = {data[i][1]}\n'
                       f'   Content = {data[i][2]}\n'
                       f'------------------------------------------'
                       )

@client.command()
async def instructors_in_same_course(ctx, Course_name):
    data = Query3(Course_name)
    for inst in data :
        await ctx.send(inst)

@client.command()
async def students_same_course_same_time(ctx, course_name, enrollment_date):
    data = Query4(course_name, enrollment_date)
    for student in data:
        await ctx.send(student[0])

@client.command()
async def resources_of_a_course(ctx,student_id, instructor_id):
    data = Query5(int(student_id), int(instructor_id))
    for i in range(len(data)):
        await ctx.send(f"Resource {data[i][0]} :\n"
          f"     Name = {data[i][1]}\n"
          f"     URL = {data[i][2]}\n"
                       f"---------------------------------------------")

@client.command()
async def submited_assignments(ctx,course_id):
    data = Query6(int(course_id))
    for i in range(len(data)):
        await ctx.send(f"Course name = {data[0][-1]}\n"
                       f"     Submission ID = {data[i][0]}\n"
                       f"     Assignment ID = {data[i][1]}\n"
                       f"     Student ID = {data[i][2]}\n"
                       f"     Submission File = {data[i][4]}\n"
                       f"-------------------------------------------")

@client.command()
async def Total_number_in_course(ctx,course_id):
    data = Query7(int(course_id))
    await ctx.send(f"Number of Students : {data}\n"
                   f"-----------------------------------")

@client.command()
async def grade_and_feedback(ctx,student_id , assignment_id):
    data = Query8(int(student_id),int(assignment_id))
    await ctx.send(f"Assignment Title = {data[0][0]}\n"
                   f"Grade = {data[0][1]}\n"
                   f"Feedback = {data[0][2]}\n"
                   f"----------------------------")

@client.command()
async def number_of_courses_for_instructor(ctx,instructor_id):
    data = Query9(int(instructor_id))
    await ctx.send(f"Instructor Name = {data[0]}\n"
                   f"Number of Course = {data[1]}\n"
                   f"----------------------------------------")



@client.command()
async def students_waiting(ctx,course_id):
    data = Query10(int(course_id))
    await ctx.send(data)


@client.command()
async def students_enrolled_more_than_years(ctx,years):
    data = Query11(int(years))
    for i in range(len(data)):
        await ctx.send(f"ID = {data[i][0]}\n"
              f"Name = {data[i][1]}\n"
                       f"------------------------------------")


@client.command()
async def studetns_scored_more_than(ctx,grade):
    data = Query12(int(grade))
    for i in range(len(data)):
        await ctx.send(f"ID = {data[i][0]}\n"
                f"Name = {data[i][1]}\n"
                       f"------------------------------------")

@client.command()
async def courses_scheduales_instructors(ctx):
    data = Query13()
    for da in data:
        await ctx.send(f"Course = {da[0]}\n"
              f"Day = {da[1]}"
              f"  Time = {da[2]}\n"
              f"Instructor = {da[3]}\n"
                       f"----------------------------------")

@client.command()
async def students_graduating_date_range(ctx , start_date, end_date):
    data = Query14(start_date, end_date)
    for da in data :
        await ctx.send(da[0])

@client.command()
async def prerequests_course(ctx ):
    data = Query15()
    for d in range(len(data)) :
        await ctx.send(f"Course = {data[d][0]}\n"
                       f"Requirment = {data[d][1]}\n"
                       f"-----------------------------")

@client.command()
async def students_enrolled_after_date(ctx , course_id , enrollment_date ):
    data = Query16(course_id , enrollment_date)
    print(data)
    for d in range(len(data)) :
        await ctx.send(f"ID = {data[d][0]}\n"
                       f"Name = {data[d][1]}\n"
                       f"Enrollment Date = {data[d][2]}\n"
                       f"-----------------------------")

@client.command()
async def Certificates_higher_than_grade(ctx , course_name, Grade ):
    data = Query17(Grade ,course_name)
    print(data)
    for d in range(len(data)) :
        await ctx.send(f"Course name = {data[d][0]}\n"
                       f"Grade = {data[d][1]}\n"
                       f"Name = {data[d][2]}\n"
                       f"-----------------------------")


@client.command()
async def dropped_classes_of_student(ctx , student_id, course_id ):
    data = Query19(student_id, course_id)
    await ctx.send(data[0][0])

@client.command()
async def students_attendance_less_than(ctx , course_id, instructor_id , count ):
    data = Query20(course_id, instructor_id , count)
    await ctx.send(data[0][0])

@client.command()
async def post_media(ctx):
    # Check if the user has attached a file to the message
    if len(ctx.message.attachments) > 0:
        # Get the first attachment from the message
        attachment = ctx.message.attachments[0]
        # Check if the attachment is less than the specified size limit
        max_size = data_limit_mb * 1000000 # Convert MB to bytes
        if attachment.size > max_size:
            await ctx.send(f"The attachment size exceeds the maximum limit of {data_limit_mb} MB.")
            return
        # Create a file object from the attachment
        file = await attachment.to_file()
        # Send the file object as a message to the channel
        await ctx.send(file=file)
    else:
        await ctx.send("Please attach a file to your message.")
client.run(Configuration.Bot_Token)