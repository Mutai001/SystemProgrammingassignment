#!/bin/bash

# Get customer information
read -p "Enter CustomerID: " CustomerID
read -p "Enter CustomerName: " CustomerName
read -p "Enter Units Consumed: " UnitConsumed

# Calculate charge per unit based on tiers
if [ $UnitConsumed -le 199 ]
then
   ChargePerUnit=120
elif [ $UnitConsumed -le 399 ]
then
   ChargePerUnit=150
elif [ $UnitConsumed -le 599 ]
then
   ChargePerUnit=180
else
   ChargePerUnit=200
fi

# Calculate total bill amount
TotalBill=$(echo "$UnitConsumed * $ChargePerUnit" | bc)

# Display results
echo "CustomerID: $CustomerID"
echo "CustomerName: $CustomerName"
echo "Units Consumed: $UnitConsumed"
echo "Charge per Unit: Ksh $ChargePerUnit"
echo "Total Bill Amount: Ksh $TotalBill"
