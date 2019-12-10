#!/bin/bash
# Desc: Clean up for items created 
# Run as root

 
# Groups to delete
GROUPS=(staff sudo adm student);

# Users to delete
USERS=(Andrew Oscar Teresa Bill Ted Irene AAron);
ADMINS=(Ted AAron)

# Dirs to delete
LOG_FILE=/tmp/Create-Users.log
DIRECTORIES=('/tmp/teachers-skel/' '/tmp/students-skel/' $LOG_FILE);
TARGET=/etc/sudoers.d/Create-Users-Tests



# Function to delete groups
function delete_groups(){
    for group in ${GROUPS[@]}
    do
        echo "Deleting Group: $group";
        groupdel -f $group;
    done
}

# Function to delete users
function delete_users(){
    for user in "${USERS[@]}"
    do
        echo "Deleting Group: $user";
        userdel -r $user;
    done
}

# Function to delete dirs
function delete_dirs(){
    for skel_dir in "${DIRECTORIES[@]}"
    do
        echo "Deleting Group: $skel_dir";
        rm -r $skel_dir;
    done
}

function remove_sudo_edits(){
    for admin in "${ADMINS[@]}"
    do
        echo "Deleting $admin Sudo priveleges.";
        sed "$d" $TARGET;
    done
}

# Clean Up using Functions
delete_groups;
delete_users;
delete_dirs;
remove_sudo_edits;