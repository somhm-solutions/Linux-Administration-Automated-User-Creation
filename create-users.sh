#/bin/bash
# Title: Create Users 

# Groups to add users to
ADMIN_GROUPS=(staff sudo adm);
TEACH_GROUPS=(staff);
STU_GROUPS=(student);

# Users to add to system
USERS=(Andrew Oscar Teresa Bill Ted Irene AAron);

# Test Values
printf "Admin Groups: ${ADMIN_GROUPS[*]}\nTeachers Groups:${TEACH_GROUPS[*]}\nStudent groups:${STU_GROUPS[*]}\nUsers:${USERS[*]}"

