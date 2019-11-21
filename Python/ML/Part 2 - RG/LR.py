# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 09:33:26 2019
author: Elijah Zolduoarrati
"""
# importing libraries
import pandas as pd

# importing files
dataset = pd.read_csv('Salary_Data.csv')
# data manipulation
x = dataset.iloc[:,1].values
y = dataset - x


