#!/bin/bash

# Skel root Directorys to create
$TEACHERS='/tmp/teachers-skel';
$STUDENTS='/tmp/students-skel';

# Test values 
printf "Teachers: $TEACHERS\nStudents: $STUDENTS";

# Skel Builds
$TEACHERS_DIRS=(Lessons Homework Grades Attendance Scheduling Media Support);
$STUDENTS_DIRS=(Lessons Homework Grades Media Support);
printf "Teachers Dirs:$(TEACHERS_DIRS)\n Students Dirs:$(STUDENTS_DIRS)"


# Build skel directory in /tmp Place in /etc if youd like to kee
