#!/bin/bash

# Get employee information
read -p "Enter employee name: " name
read -p "Enter hours worked: " hours
read -p "Enter rate per hour: " rate

# Calculate basic pay
basic_pay=$(echo "$hours * $rate" | bc)

# Calculate tax based on conditions
if [[ $basic_pay -gt 70000 ]]; then
  tax=$(echo "$basic_pay * 0.25" | bc)
elif [[ $basic_pay -gt 15000 ]]; then
  tax=$(echo "$basic_pay * 0.15" | bc)
else
  tax=0
fi

# Calculate net pay
net_pay=$(echo "$basic_pay - $tax" | bc)

# Display results
echo "Employee Name: $name"
echo "Basic Pay: $$basic_pay"
echo "Tax: $$tax"
echo "Net Pay: $$net_pay"
