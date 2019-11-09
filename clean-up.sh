#!/bin/bash
# Desc: Clean up for items created 
# Run as root

# Groups to delete
GROUPS=(staff sudo adm student);

# Users to delete
USERS=(Andrew Oscar Teresa Bill Ted Irene AAron);

# Dirs to delete
SKEL_DIRS=('/tmp/teachers-skel/' '/tmp/students-skel/');


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
    for user in ${USERS[@]}
    do
        echo "Deleting Group: $user";
        userdel -r $user;
    done
}

# Function to delete dirs
function delete_dirs(){
    for skel_dir in ${SKEL_DIRS[@]}
    do
        echo "Deleting Group: $skel_dir";
        rm -r $skel_dir;
    done
}