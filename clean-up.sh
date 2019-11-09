#!/bin/bash
# Desc: Clean up for items created 
# Run as root

# Groups to add users to
ADMIN_GROUPS='staff,sudo,adm';
TEACH_GROUPS='staff';
STU_GROUPS='student';

# Users to add to system
STUDENTS=(Andrew Oscar Teresa Bill);
TEACHERS=(Ted Irene AAron);

# Skel Dirs to Use
TEACHERS_SKEL='/tmp/teachers-skel/';
STUDENTS_SKEL='/tmp/students-skel/';

# Account Expiration Dates 
STU_EXPIRATION='2020-01-01';
TEACH_EXPIRATION='2020-02-01';
ADMIN_EXPIRATION='2020-03-01';


groupdel 