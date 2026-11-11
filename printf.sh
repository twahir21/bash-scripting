#!/bin/bash

##  #! - is called shebang it used to identify location of the interpreter which is in binary and is called bash

# chmod +x filename -> used to make file executable like ./filename then enter

# so for other languages like if running python use #!/usr/bin/python3

business="Simamia Shop"
sales=250000
expenses=50000
profit=$((sales - expenses))

printf "\n================================================\n"
printf "%s\n" "$business"
printf "\n===============================================\n"


printf "%-15s %12s \n" "DESCRIPTION: " "AMOUNT (TZS): "
printf -- "--------------------------------------------------\n"

printf "%-15s %12d \n" "Sales" "$sales"
printf "%-15s %12d\n" "Expenses" "$expenses"
# printf "---------------------------------------------------\n" this is wrong
printf "\n---------------------------------------------------\n"

printf "%-15s %12d\n" "Profit" "$profit"
printf "====================================================\n"
