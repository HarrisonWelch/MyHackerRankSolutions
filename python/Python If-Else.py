#!/bin/python

import math
import os
import random
import re
import sys



if __name__ == '__main__':
    NOT_WEIRD = "Not Weird"
    WEIRD = "Weird"
    N = int(raw_input())
    
    if N % 2 == 1:
        print WEIRD
    elif N >= 2 and N <= 5:
        print NOT_WEIRD
    elif N >= 6 and N <= 20:
        print WEIRD
    elif N > 20:
        print NOT_WEIRD

