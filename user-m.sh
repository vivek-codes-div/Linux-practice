#!/bin/bash


<< Help

User management script

Help


usage() {
  echo "Usage: $0 [-c|--create] [-d|--delete] [-r|--reset] [-l|--list] [-h|--help]"
  echo ""
  echo "Options:"
  echo "  -c, --create    Create a new user"
  echo "  -d, --delete    Delete a user"
  echo "  -r, --reset     Reset user password"
  echo "  -l, --list      List users and UIDs"
  echo "  -h, --help      Show this help message"
}

create_user() {

	read -p "Username: " username
	if id "$username" &>/dev/null; then
		echo " User '$username' already exists "
		exit 1
	fi

	sudo useradd -m -s /bin/bash "$username"
	read -p "Password for $username: " passwd
        echo -e "passwd\npasswd $username"
	echo "User created successfully"
}

delete_user() {

	read -p "Which usere to delete: " username
	if id ! "$username" &>/dev/null; then
	       echo "User does not exist"
       exit 1
	fi
 sudo deluser --remove-home "$username"
echo "User deleted successfully" 
}

reser() {
	read -p "which user password to chnage: " username
	if id ! "$username" &>/dev/null; then
		echo "User does not exist"
		exit 1
		fi
		read -p "Password: " passwd
		echo -e "passwd\npasswd | sudo passwd $username"
		echo "Password reset successfull"
}

list_users() {
	echo "username UID"
	echo "-------"
	getent passwd | awk -F: '{ print $1, $3}'
}

if [ $# -eq 0 ]; then
	usage
	exit 1
fi

case "$1" in
  -c|--create)
    create_user
    ;;
  -d|--delete)
    delete_user
    ;;
  -r|--reset)
    reset_password
    ;;
  -l|--list)
    list_users
    ;;
  -h|--help)
    usage
    ;;
  *)
    echo "❌ Unknown option: $1"
    usage
    exit 1
    ;;
esac
