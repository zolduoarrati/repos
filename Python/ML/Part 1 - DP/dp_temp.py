# -*- coding: utf-8 -*-
"""
Created on Thu Nov 21 12:42:55 2019
author: Elijah Zolduoarrati
"""
# importing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import Imputer, LabelEncoder, OneHotEncoder
#importing a dataset
dataset = pd.read_csv('Data.csv')
# create the independent variable vector
X = dataset.iloc[:, :-1].values
# create the dependent variable vector
Y = dataset.iloc[:, 3:].values
# dealing with missing data / imputer object
imputer = Imputer(missing_values='NaN', strategy = 'mean', axis = 0)
# fitting imputer  to the matrix that contain missing data
imputer = imputer.fit(X[:, 1:3])
# transform the missing data
X[:, 1:3] = imputer.transform(X[:,1:3])
# encoding categorical variables
labelencoder_X = LabelEncoder().fit_transform(X[:, 0])
# applying encoder object to categorical variable
X[:, 0] = labelencoder_X
# creating categorical dummy variables
onehotencoder = OneHotEncoder(categorical_features = [0]).fit_transform(X).toarray()
X = onehotencoder

# applying encoder object to categorical variable

# applying encoder object to categorical variable

# applying encoder object to categorical variable

# applying encoder object to categorical variable

# applying encoder object to categorical variable

