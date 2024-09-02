#!/bin/bash

# Function to view recent log entries
view_logs() {
    echo "Viewing recent log entries for cron jobs..."
    sudo tail -f -n 50 /var/log/syslog
}

# Function to edit crontab
edit_crontab() {
    echo "Opening crontab for editing..."
    crontab -e
}

# Function to remove crontab
remove_crontab() {
    read -p "Are you sure you want to remove the crontab? (y/n): " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Removing crontab..."
        crontab -r
    else
        echo "Crontab removal canceled."
    fi
}

# Function to list crontab entries
list_crontab() {
    echo "Listing crontab entries..."
    crontab -l
}

# Function to display the menu
display_menu() {
    clear
    echo "Crontab Management Script"
    echo "========================"
    echo "1) View recent log entries"
    echo "2) Edit crontab"
    echo "3) Remove crontab"
    echo "4) List crontab entries"
    echo "5) Exit"
    echo ""
    read -p "Enter your choice (1-5): " choice
}

# Main script logic
while true; do
    display_menu
    case $choice in
        1) view_logs ;;
        2) edit_crontab ;;
        3) remove_crontab ;;
        4) list_crontab ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo ""
done

