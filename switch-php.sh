#!/bin/bash

function switch_php() {
    local prompt="$1" outvar="$2"
    shift
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes
    printf "$prompt\n"
    while true
    do
        # list all options (option list is zero-based)
        index=0 
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then
            	echo -e " >\e[7m$o\e[0m" # mark & highlight the current option
    	    else
    	        echo "  $o"
            fi
            index=$(( $index + 1 ))
        done
        read -s -n3 key # wait for user to key in arrows or ENTER
        if [[ $key == $esc[A ]] # up arrow
        then cur=$(( $cur - 1 ))
            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]] # down arrow
        then cur=$(( $cur + 1 ))
            [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
        then break
        fi
        echo -en "\e[${count}A" # go up to the beginning to re-render
    done

    printf -v $outvar "${options[$cur]}"

    if [[ $cur -gt 0 ]]
    then
        echo "* Enabling Apache PHP ${options[$cur]} module"
        sudo a2enconf php${options[$cur]}-fpm

        echo "* Disabling Apache PHP $CURRENT_PHP_VERSION module"
        sudo a2disconf php$CURRENT_PHP_VERSION-fpm

        echo "* Restarting Apache..."
        sudo service apache2 restart

        echo "* Switching CLI PHP to ${options[$cur]}"
        sudo update-alternatives --set php /usr/bin/php${options[$cur]} > /dev/null

        echo "* Current PHP-version: $(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")"
    fi
}

CURRENT_PHP_VERSION=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

options=(
    "Cancel, stay on PHP $CURRENT_PHP_VERSION"
    "8.2"
    "8.1"
    "8.0"
    "7.4"
    "7.3"
    "7.2"
    "7.1"
    "7.0"
    "5.6"
)

switch_php "Switch to PHP-version:" selected_choice "${options[@]}"
