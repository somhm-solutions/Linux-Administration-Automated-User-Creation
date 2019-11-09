#!/bin/bash

# Skel root Directorys to create
$TEACHERS='/tmp/teachers-skel';
$STUDENTS='/tmp/students-skel';

# Skel Builds
$TEACHER_DIRS=(Lessons Homework Grades Attendance Scheduling Media Support);
$STUDENT_DIRS=(Lessons Homework Grades Media Support);

# Build skel directory in /tmp Place in /etc if youd like to keep

mkdir -p "$TEACHERS/${TEACHER_DIRS[*]}"
#mkdir -p /tmp/students-skel/

