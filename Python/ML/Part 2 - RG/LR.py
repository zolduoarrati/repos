# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 09:33:26 2019
author: Elijah Zolduoarrati
"""
# importing libraries
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
# importing files
dataset = pd.read_csv('Salary_Data.csv')
# data manipulation
x = dataset.iloc[:,:-1].values
y = dataset.iloc[:,1].values
# creating train and test data
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 1/3,random_state=0)
# fitting linear regression to the training set
regressor = LinearRegression().fit(x_train, y_train)
# predicting the test set results
y_pred = regressor.predict(x_test)
# visiualising training set
plt.scatter(x_train,y_train, color = 'red')
plt.plot (x_train,regressor.predict(x_train), color = 'blue')
plt.title('salary vs. experience (training set)')
plt.xlabel('years of experience')
plt.ylabel('salary')
plt.show()
# visiualising testing set
plt.scatter(x_test,y_test, color = 'red')
plt.plot (x_train,regressor.predict(x_train), color = 'blue')
plt.title('salary vs. experience (training set)')
plt.xlabel('years of experience')
plt.ylabel('salary')
plt.show()
