#!/bin/bash
# Baseline Test
USERS=(Andrew Oscar Teresa Bill Ted Irene AAron);

function test_skels(){
    echo
    #echo /tmp;
    #ls /tmp;

    echo
    echo teachers-skel/:;
    ls /tmp/teachers-skel/;

    echo
    echo students-skel/:;
    ls /tmp/students-skel/;
    echo
}

function test_users(){
    ls /home;
    for user in "${USERS[@]}"
    do 
        echo
        echo $user Home:
        ls /home/$user;
        groups $user;
    done
}

test_skels
test_users
