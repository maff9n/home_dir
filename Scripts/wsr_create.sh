#!/bin/sh

# PURPOSE OF THIS SCRIPT
# This script is meant to speed up the weekly process of creating a WSR.
# Either you can just forward the created text via email or you go a step further and make the created file a component of an existing repository aka wiki.
# This script assumes that certain values or structurel characteristics of your WSR don't change and if they do you should be able to tweak the details in the lines below.
# When this script speeds up the WSR managment for you aswell, I'd love to hear from you.
# Regards Marvin


###
### The following variable you need to change
###


#The Name that is shown at the end of the WSR
name="Marvin"


###
### The following variables you may wanna change
###


#Path where the WSR file shall be created. Potentially the path to the local WSR repository.
local_directory="$HOME"

#Path to the editor I use
editor=/bin/vim

#The default file name is set to the following
default_file_name="$(date +"WSR %G W%U")"


###
### The following variables you need to change if you wanna involve GitLab in some way or automatically include a link in your email that is pointing to the WSR in the wiki
###


#Only used when Option GITLAB_LINK is set to true...
#My Gitlab Name for accessing the WSR repository wiki
gitlab_name="mmann"

#Only used when Option GITLAB_LINK is set to true...
#My Gitlab repository name where the wiki lives
repository_name="wsr"

#Only used when Option GITLAB_LINK is set to true...
#Path to the remote WSR wiki
wiki="https://gitlab.vpn.cyberus-technology.de/$gitlab_name/$repository_name/-/wikis/"


###
### Options
###


# Include a link in the email to the WSR repository wiki
# true = include it
# false = don't include it
GITLAB_LINK=false

# When the editor is closed the value of $default_file_name is copied to your clipboard assuming
# you already copied the content of the file to the main field of your email client and now intend to add the subject information
# true = copies $default_file_name to clipboard
# false = doesn't copy $default_file_name to clipboard
COPY_TO_CLIPBOARD=false

# Right before the script is done - cd to the directory which path is stored in $dir assuming
# you immediately wanna push your local changes to the remote repository (adds target of the link included in the file)
# true = cds to the directory $dir
# false = doesn't change the shell's current location
CD_AFTER_EDDITING=false


###
### Execution
###


echo "Enter the name of the WSR file you intend to create. Press ENTER to use the default./br
(Default: $default_file_name)"
read custom_file_name

if test -z "$custom_file_name" ; then
    file_name="$default_file_name"
else
    file_name="$custom_file_name"
fi

if test -f "$local_directory/$file_name"; then
    file_existed_before=true
else
    file_existed_before=false
fi

link_to_file="$wiki/${sed -e 's/\s\+/,/g' $file_name}"

addToWSR(){
    if ! "$file_existed_before"; then
        text="$1"
        echo "$text" >> "$local_directory/$file_name"
    fi
}

addToWSRWhenConditionTrue(){
    if ! "$file_existed_before"; then
        text="$1"
        condition="$2"
        if test "$condition"; then
            echo "$text" >> "$local_directory/$file_name"
        fi
    fi
}

addToWSR "Hi Team,  "

addToWSRWhenConditionTrue "find this WSR also here ([Gitlab]($link_to_file)).  " $GITLAB_LINK

addToWSR "## tl;dr  
-  


Thats it.  
Have a wonderful week  
$name"

"$editor" "$local_directory/$file_name"

if "$COPY_TO_CLIPBOARD"; then
    echo -n $default_file_name | xclip -sel c
fi

if "$CD_AFTER_EDDITING"; then
    cd "$local_directory"
fi









