#!/bin/bash

CATKIN_SHELL=bash

printf "* RoboticsEnvironment/environment.sh\n\n"

# Display Applied Robotics logo
printf "       \e[32m++++++ Applied Robotics  ++++++\n"
printf "       |\e[34m                             \e[32m|\n"
printf "       |\e[34m           \_\               \e[32m|\n"
printf "       |\e[34m          (_**)              \e[32m|\n"
printf "       |\e[34m         __) #_              \e[32m|\n"
printf "       |\e[34m        ( )...()             \e[32m|\n"
printf "       |\e[34m        || | |I|             \e[32m|\n"
printf "       |\e[34m        || | |()__/          \e[32m|\n"
printf "       |\e[34m        /\(___)              \e[32m|\n"
printf "       |\e[34m       _-\"\"\"\"\"\"\"-_\"\"-_       \e[32m|\n"
printf "       |\e[34m       -,,,,,,,,- ,,-        \e[32m|\n"
printf "       \e[33mTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT\n\n\e[0m"


if [ -z "$AR_CATKIN_ROOT" ]
then
  export AR_CATKIN_ROOT=$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
  source ${AR_CATKIN_ROOT}/aliases

  # check whether devel folder exists
  printf "\t* Loading ROS environment\n"
  if [ -f "${AR_CATKIN_ROOT}/devel/setup.bash" ]; then
      # source setup.sh from same directory as this file
      source "${AR_CATKIN_ROOT}/devel/setup.bash"
      printf "\t\t* \e[32m DONE!\n\e[0m"
  else
      source "/opt/ros/kinetic/setup.bash"
      printf "\t\e[31mYou need to build first before you can source\n\e[0m"
      printf "\t\e[33mRun 'catkin build' in ${AR_CATKIN_ROOT} directory\n\e[0m"
      read -p "\t\tWant to build it now? [y/n]" -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        catkin clean --yes
        catkin build
        source "${AR_CATKIN_ROOT}/devel/setup.bash"
      fi
  fi
else
  printf "\t*\e[33m Seems that you already source this environment.\e[0m\n"  
fi