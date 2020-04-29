#!/bin/python3

import sys
import math

if __name__ == "__main__":
    meal_cost = float(input().strip())
    tip_percent = int(input().strip())
    tax_percent = int(input().strip())
    
    # ==================================
    
    tip_total = meal_cost * (tip_percent / 100)
    tax_total = meal_cost * (tax_percent / 100)
    total = meal_cost + tip_total + tax_total
    print("The total meal cost is " + str(round(total)) + " dollars.")
