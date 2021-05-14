#! /bin/bash
a=""
function read_dir(){
    local space="$2"
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            echo "$space"$file
	    local temp="$space"
	    space="    ""$space"
            read_dir $1"/"$file "$space"
	    space="$temp"
        else
            echo "$space"$file
        fi
    done
}

read_dir . $a