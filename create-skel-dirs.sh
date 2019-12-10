#!/bin/bash

# Skel root Directorys to create
TEACHERS='/tmp/teachers-skel/';
STUDENTS='/tmp/students-skel/';



# Skel Builds using bash Array Syntax
TEACHERS_DIRS=("$TEACHERS"Lessons "$TEACHERS"Homework "$TEACHERS"Grades "$TEACHERS"Attendance "$TEACHERS"Scheduling "$TEACHERS"Media "$TEACHERS"Support);
STUDENTS_DIRS=("$STUDENTS"Lessons "$STUDENTS"Homework "$STUDENTS"Grades "$STUDENTS"Media "$STUDENTS"Support);

# Test values 
#printf "Teachers: $TEACHERS\nStudents: $STUDENTS\n\n";
#printf "Teachers Dirs:${TEACHERS_DIRS[*]}\n Students Dirs:${STUDENTS_DIRS[*]}";

# Build skel directory in /tmp Place in /etc if youd like to kee
mkdir -p ${STUDENTS_DIRS[*]};
mkdir -p ${TEACHERS_DIRS[*]};