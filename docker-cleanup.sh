#!/bin/bash

# Variables
log_file='/var/log/docker-cleanup.log'

# Logger
function log_message () {
  local message="$1"
  printf "[$(date '+%d %B %Y %T %:z')] - $message\n" >> "$log_file" 2>&1
}

# Main
log_message "Starting script..."

# Do not run if removal already in progress.
(pgrep "docker rm" && exit 0) >> $log_file 2>&1

log_message "Removing unnecessary containers..."
# Get Dead and Exited containers.
(docker ps -a | grep "Dead\|Exited" | awk '{print $1}' | xargs --no-run-if-empty docker rm)  >> $log_file 2>&1

log_message "Removing old docker images..."
# Get old images
(docker images -qf dangling=true | xargs --no-run-if-empty docker rmi) >> $log_file  2>&1

log_message "Removing unused docker volumes..."
# Get unused volumes
(docker volume ls -qf dangling=true | xargs --no-run-if-empty docker volume rm) >> $log_file  2>&1

log_message "Removing others..."
# Get last items
(docker system prune -f) >> $log_file  2>&1