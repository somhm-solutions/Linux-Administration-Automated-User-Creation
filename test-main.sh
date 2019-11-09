#!/bin/bash
# Desc: Tests for completion of Code functionality

# Log file path
log_path='/tmp/var/log/test-errors.log'

# Groups to delete
GROUPS=(staff sudo adm student);

# Users to delete
USERS=(Andrew Oscar Teresa Bill Ted Irene AAron);

# Dirs to delete
DIRECTORIES=('/tmp/teachers-skel/' '/tmp/students-skel/' '/tmp/var/log/test-errors.log');

# Skel Dirs to Use
TEACHERS='/tmp/teachers-skel/';
STUDENTS='/tmp/students-skel/';

# Default Shell
DEFAULT_SHELL='/bin/bash'

# Account Expiration Dates 
STU_EXPIRATION='2020-01-01';
TEACH_EXPIRATION='2020-02-01';
ADMIN_EXPIRATION='2020-03-01';

# Directorys to test for existance
DIRS=("$TEACHERS"Lessons "$TEACHERS"Homework "$TEACHERS"Grades "$TEACHERS"Attendance "$TEACHERS"Scheduling "$TEACHERS"Media "$TEACHERS"Support);
STUDENTS_DIRS=("$STUDENTS"Lessons "$STUDENTS"Homework "$STUDENTS"Grades "$STUDENTS"Media "$STUDENTS"Support);
DIRECTORIES=('/tmp/teachers-skel/' '/tmp/students-skel/' '/tmp/var/log/test-errors.log');


# Test Directories Creation 
function test_directories(){
    for directory in "${TEST_DIRECTORIES[@]}"
    do
        # Test if directory exists. If not log information in /tmp/var/log/test-errors.log
        [ -d "${$directory}" ] && echo "Directory: $directory, Status: PASSED" >>  $log_path || echo "Directory: $directory Status: FAILED" >>  $log_path;
    done
}

# Test Users 
function test_users(){
    for user in "${USERS[@]}"
    do
        # Test to see if each users home dir exists and has the proper skel
        echo Testing User home dir
        [ -d "/home/$user" ] && echo "Directory: $directory, Status: PASSED" >>  $log_path || echo "Directory: $directory Status: FAILED" >>  $log_path;

        # Test for groups 
        usergroups=$(groups $user);

    done;
}

# Test Group Creation

# Test User Creation

# Test User Directory Creation

