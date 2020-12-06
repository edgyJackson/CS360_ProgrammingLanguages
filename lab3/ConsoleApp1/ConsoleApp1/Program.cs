using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{

    //this is my "Course" class which hold info such as nam eand schedule for a course------------------<--<--CLASS ONE-----------------
    public class Course
    {
        //private data members name and schedule
        private string name;
        private string schedule;

        // copy constructor for student.
        public Course(Course other)
        {
            name = other.name;
            schedule = other.schedule;
        }

        //Course constructor takes to strings as 
        //arguements format second string consistent every time
        public Course(string courseName, string courseSchedule)
        {
            name = courseName;
            schedule = courseSchedule;

        }


        //prints course details
        public void printSelf()
        {
            
            Console.WriteLine("Name     : " + name);
            
        }



    }

















    //this is my classroom class for Professors to keep track of their class rooms------------------<--<--CLASS TWO-----------------
    public class Classroom
    {
        //private data members name and schedule
        private Course classCourse;
        private Student[] students = new Student[5];
        private int capacity;


        // copy constructor for Classroom.
        public Classroom(Classroom other)
        {
            classCourse = other.classCourse;
            capacity = other.capacity;

            for (var j = 0; j < students.Length; j++)
            {
                students[j] = new Student(other.students[j]);
            }

        }
        //Classroom constructor takes Course arguement and sets 
        //classCourse to the roomCourse and sets capacity to 0
        public Classroom(Course roomCourse)
        {
            classCourse = roomCourse;
            capacity = 0;

            for (var j = 0; j < students.Length; j++)
            {
                students[j] = new Student("Empty Seat");
            }
        }

        //adds new course to student classes array if class load is not full
        public void addStudent(Student newStudent)
        {
            if (capacity < 5)
            {
                students[capacity] = new Student(newStudent);
                capacity++;
            }
            else
            {
                Console.WriteLine("\tClass caopacity is full. Please call registrars office.\n");
            }
        }
        //to print classroom details
         public void printClassroom()
        {
            Console.WriteLine("***************************************");            
            classCourse.printSelf();       

            Console.WriteLine("------Students in class----------");
            if (capacity > 0)
            {

                for (var j = 0; j < capacity; j++)
                {
                    students[j].getName();
                    Console.Write("\n");
                }
                Console.Write("\n");
            }
            else
            {
                Console.WriteLine("No students in class\n");
            }
        }
    }
























    //This is my abstract Person class that is used for creating student and professor classes------------------<--<--CLASS THREE-----------------
    //has name and 2 abstract methods
    public abstract class Person
    {
        protected string name;
        public abstract void SayHi(); //all classes that implement Person must have a SayHi method
        public abstract void printInfo();
    }










    //This is my Student class which keeps track of courses, year, gpa and sNumber------------------<--<--CLASS FOUR-----------------
    public class Student : Person
    {
        //private data members
        private static readonly Random rnd = new Random();
        private static int studentCount = 0;
        private int year;
        private double gPA;
        private Course[] classes = new Course[3];
        private int courseLoad = 0;
        private int sNumber;

        // getName method
        public void getName()
        {
            Console.Write(name);
        }
        // copy constructor for student.
        public Student(Student other)
        {
            name = other.name;
            year = other.year;
            gPA = other.gPA;
            courseLoad = other.courseLoad;
            sNumber = other.sNumber;

            for (var j = 0; j < classes.Length; j++)
            {
                classes[j] = new Course(other.classes[j]);
            }
        }
        //Student constructor 
        public Student(string newStudentName)
         {
            this.name = newStudentName;
             this.sNumber = 5000 + studentCount;
            studentCount++;

            //generating random year and gpa
             gPA = rnd.NextDouble() * (4.0 - 2.0) + 2.0;
            year = rnd.Next(1, 5);

            for (var j = 0; j < classes.Length; j++)
            {
                classes[j] = new Course("blank", "blank");
                Console.Write("\n");
            }
        }
        //override Persons abstract SayHi method
        override public void SayHi()
        {
            Console.WriteLine("wuzzaaaaaaaaaaaaaaaaaaaap!!\n ");          
        }
        //override to print student details
        override public void printInfo()
        {
            Console.WriteLine("Student Info:------------------------------- ");
            Console.WriteLine("Name     : " + name);
            Console.WriteLine("SNumber  : " + sNumber);
            Console.WriteLine("GPA      : {0:0.00}", gPA);

            //switch statement code to display the correct year in school.
            string level;
            switch (year)
            {
                case 1:
                    level = "FRESHMAN";
                    break;
                case 2:
                    level =  "SOPHOMORE";
                    break;
                case 3:
                    level =  "JUNIOR";
                    break;
                default:
                    level = "SENIOR";
                    break;
            }

            Console.WriteLine("Year    : " + level );
            Console.Write("------Courses--------\n");
                for (var j = 0; j < classes.Length; j++)
                {
                classes[j].printSelf();
                    Console.Write("\n");
                }
        }
        //adds new course to student classes array if class load is not full
        public void addNewCourse(Course newCourse)
        {
            if (courseLoad < 3)
            {
                classes[courseLoad] = new Course(newCourse);
                courseLoad++;
            }
            else
            {
                Console.WriteLine("\tStudent class list is full. Please call registrars office.\n");
            }
        }

    }












    //This is my Professor class who only has an array of classrooms------------------------------------<--<--CLASS FIVE-----------------
    public class Professor : Person
    {
        //private data members
        private Classroom[] classRooms = new Classroom[3];
        int workLoad;
        
        //Professor constructor 
        public Professor(string professorName)
        {
            name = professorName;
            workLoad = 0;
        }
        //override Persons abstract SayHi method
        override public void SayHi()
        {
            Console.WriteLine("Hello, pleased to make your acquantance my didactive friend!!\n ");
        }
        //override to print student details
        override public void printInfo()
        {            
            Console.WriteLine("Name     : Professor " + name);
            Console.WriteLine("Classrooms ------------------------\n");

            if (workLoad > 0)
            {
                for (var j = 0; j < workLoad; j++)
                {
                    classRooms[j].printClassroom();
                    Console.Write("\n");
                }
            }
            else
            {
                Console.WriteLine("\tProfessor has no Classrooms \n");
            }
        }
        //adds new classroom to classrooms array
        public void addClassRoom(Classroom newClass)
        {
            if (workLoad < 3)
            {
                classRooms[workLoad] = new Classroom(newClass);
                workLoad++;
            }
            else
            {
                Console.WriteLine("Profess class list is full. Please call registrars office.\n");
            }
        }


    }










    class Program //-------------------<-----<---My Main-----------------------<-----<---------CLASS 6--------------
    {
        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("Hello Principle!");
            Console.WriteLine("I've generated a new school for you!");

            //Creating courses for school
            Course Math = new Course("MA 354: Discrete Math ", "NS 137 : MTWR 8am-10am");
            Course dataStructs = new Course("CS 260: Data Structs ", "ODS 133 : MTR 9am-10am");
            Course cPU_Org = new Course("CS 271: CPU Organiz.. ", "NS 137 : MWF 1pm-3am");
            Course Dance = new Course("DA 101: Jiggy with it ", "MA 137 : MTWRF 8am-5pm");
            Course Chem = new Course("CH 117: Chemical X ", "NS 137 : MTWR 8am-10am");
            Course Physics = new Course("PHY 210: Inertia Stuff ", "IS 312 : MTWR 4pm-5pm");
            Course Weights = new Course("WE 254: Weight Straining ", "SA 108 : MR 2pm-5pm");
            Course Barbi = new Course("BA 165: Barbi Class", "BAB 111 : M 8am-10am");
            Course BIO = new Course("BIO 255: Frogs & Cows ", "NS 113 : MTWR 8am-10am");
            Course PE = new Course("PE 354: Advanced Lounging ", "WUC 110 : MTWR 8am-10am");

            //creating students for school
            Student tom = new Student("Tom");   
            Student barb = new Student("Barb");
            Student alice = new Student("Alice");
            Student jim = new Student("Jim");
            Student brittany = new Student("Brittany");
            Student jenny = new Student("Jenny");

            //creating Professors for the school
            //creatig students for school and assigning courses
            Console.Write("--------------------------Professors-------------------------------------------------------------------");
            Professor professorPhil = new Professor("Phil");
            Professor professorSmith = new Professor("Smith");
            Professor professorBeatrice = new Professor("Beatrice");
            Professor professorDennis = new Professor("Deniis");
            Professor professorMartha = new Professor("MARTHAA!!");          
            Professor professorGirl = new Professor("Girl");

            //assigning courses to students
            tom.addNewCourse(Math);
            tom.addNewCourse(Weights);
            tom.addNewCourse(Chem);
            barb.addNewCourse(Dance);
            barb.addNewCourse(BIO);
            barb.addNewCourse(dataStructs);
            alice.addNewCourse(cPU_Org);
            jim.addNewCourse(Barbi);
            brittany.addNewCourse(PE);
            jenny.addNewCourse(PE);

            //Creating classrooms for school and adding students to each

            Classroom one = new Classroom(Math);
            one.addStudent(tom);
            one.addStudent(alice);
            one.addStudent(barb);

            Classroom two = new Classroom(dataStructs);
            two.addStudent(jenny);
            two.addStudent(brittany);
            two.addStudent(jim);

            Classroom three = new Classroom(cPU_Org);
            three.addStudent(jenny);
            three.addStudent(brittany);
            three.addStudent(alice);

            Classroom four = new Classroom(Weights);
            four.addStudent(tom);
            four.addStudent(brittany);
            four.addStudent(jim);

            Classroom five = new Classroom(Barbi);

            five.addStudent(brittany);
            five.addStudent(jim);
            five.addStudent(alice);

            Classroom six = new Classroom(PE);
            six.addStudent(jenny);
            six.addStudent(brittany);
            six.addStudent(jim);




            //assigning class rooms to professors


            professorPhil.addClassRoom(one);
            professorPhil.printInfo();

         
            professorSmith.addClassRoom(two);
            professorSmith.printInfo();


            professorBeatrice.addClassRoom(three);
            professorBeatrice.printInfo();

            professorDennis.addClassRoom(four);
            professorDennis.printInfo();


            professorMartha.addClassRoom(five);
            professorMartha.addClassRoom(two);
            professorMartha.addClassRoom(one);
            professorMartha.addClassRoom(four);
            professorMartha.printInfo();


            professorGirl.addClassRoom(six);
            professorGirl.printInfo();





            Console.Write("--------------------------Students---------------------------------------------------------------------\n");
            tom.printInfo();
            barb.printInfo();
            alice.printInfo();
            jim.printInfo();
            brittany.printInfo();
            jenny.printInfo();


            Console.Write("--------------------------Classrooms---------------------------------------------------------------------\n");
            one.printClassroom();
            two.printClassroom();
            three.printClassroom();
            four.printClassroom();
            five.printClassroom();
            six.printClassroom();


            Console.WriteLine("Student SayHi() ");
            tom.SayHi();

            Console.WriteLine("Professor SayHi() ");
            professorBeatrice.SayHi();




            Console.ReadKey();

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app! 
        }
    }
}
