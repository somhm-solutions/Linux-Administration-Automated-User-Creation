#/bin/bash
# Title: Create Users 

# Groups to add users to
ADMIN_GROUPS=(sudo adm);
TEACH_GROUPS='staff';
STU_GROUPS='student';

# Users to add to system
STUDENTS=(Andrew Oscar Teresa Bill);
TEACHERS=(Ted Irene AAron);

# Skel Dirs to Use
TEACHERS_SKEL='/tmp/teachers-skel/';
STUDENTS_SKEL='/tmp/students-skel/';

# Default Shell
DEFAULT_SHELL='/bin/bash'

# Account Expiration Dates 
STU_EXPIRATION='2020-01-01';
TEACH_EXPIRATION='2020-02-01';
ADMIN_EXPIRATION='2020-03-01';

# Test Values
#echo "Testing Values to be created:"
#printf "\nAdmin Groups: $ADMIN_GROUPS\nTeachers Groups:$TEACH_GROUPS\nStudent groups:$STU_GROUPS\nUsers:${USERS[*]}\nstudent skel:$STUDENTS_SKEL\nTeachers skel: $TEACHERS_SKEL\n"

# Create needed groups
function add_groups(){
    groups=($STU_GROUPS $TEACH_GROUPS $ADMIN_GROUPS[0], $ADMIN_GROUPS[1]);
    for group in ${groups[@]}
    do 
        printf "Creating group $group";
        groupadd $group  2>/dev/null;
    done
}

# Create Students Users loop through array with the syntax below 
function add_students(){
    for student in "${STUDENTS[@]}";
    do 
        printf "Now adding STUDENT user: $student\nGroups: $STU_GROUPS\nSkel:$STUDENTS_SKEL\nExpiration: $STU_EXPIRATION\n\n";
        useradd -m -k $STUDENTS_SKEL -e $STU_EXPIRATION -f 0 -s $DEFAULT_SHELL -G $STU_GROUPS  $student;
    done
}

# Create Teacher Users loop through array with the syntax below 
function add_teachers(){
    for teacher in "${TEACHERS[@]}";
    do 
        printf "Now adding TEACHER user: $teacher\nGroups: $TEACH_GROUPS\nSkel:$TEACHERS_SKEL\nExpiration: $TEACH_EXPIRATION\n\n";
        useradd -m -k $TEACHERS_SKEL -e $TEACH_EXPIRATION -f 0  -s $DEFAULT_SHELL -G $TEACH_GROUPS  $teacher;
    done
}

function add_admins(){
    for admin in "${ADMINS[@]}"
    do
        for group in "{$ADMIN_GROUPS[@]}"
        do
            printf "\nAdding admin: $admin to group: $group";
            usermod -aG $group $admin;
        done
    done
}

