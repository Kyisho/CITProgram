USE [master]
GO

IF DB_ID ('CITProgram') IS NOT NULL
	DROP DATABASE [CITProgram];
GO

CREATE DATABASE [CITProgram]
GO

USE [CITProgram]
GO

/*
For the identity columns.
I thought tinyint would be too small.
I wasn't sure if smallint would be too big or not.
*/

CREATE TABLE [Instructor]
(
[InstructorID] smallint IDENTITY PRIMARY KEY,
[InstructorName] varchar(50) NOT NULL,
[InstructorEmail] varchar(50) NOT NULL,
[InstructorPhone] char(10) NOT NULL
);

CREATE TABLE [Course] --Am I thinking of the wrong thing? Class, not course?
(
[CourseID] smallint IDENTITY PRIMARY KEY,
[InstructorID] smallint REFERENCES [Instructor] (InstructorID),
[CourseName] varchar(50) NOT NULL,
[CourseDescription] varchar(150) NOT NULL
);

CREATE TABLE [Book]
(
[BookID] smallint IDENTITY PRIMARY KEY,
[CourseID] smallint REFERENCES [Course] (CourseID),
[BookName] varchar(75) NOT NULL,
[BookISBN] char(13) NOT NULL,
[BookDescription] varchar(150)
);

CREATE TABLE [Schedule] --Schedules for: Classes, Lab time, and best hours to reach instructors?
(
[ScheduleID] smallint IDENTITY PRIMARY KEY,
[InstructorID] smallint REFERENCES [Instructor] (InstructorID),
[CourseID] smallint REFERENCES [Course] (CourseID), --I'm starting to think we need a class table.
[ClassSchedule] datetime NOT NULL,--Not sure how we would set up each schedule column
[LabHours] datetime NOT NULL, --Able to know when lab is open is important
[OfficeHours] datetime NOT NULL --We should show when teacher is available

);

CREATE TABLE [Project] --Not sure what we'll need in this one.
(
[ProjectID] smallint IDENTITY PRIMARY KEY
);

CREATE TABLE [Analytics] --Not sure what all we'll want to keep track of.
(
[AnalyticID] smallint IDENTITY PRIMARY KEY
);
