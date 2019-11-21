# -*- coding: utf-8 -*-
"""
Created on Thu Nov 21 16:03:03 2019
author: Elijah Zolduoarrati
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import Imputer, LabelEncoder, OneHotEncoder
from sklearn.model_selection import train_test_split 
#importing a dataset
dataset = pd.read_csv('Data.csv')
# create the independent variable vector
x = dataset.iloc[:, :-1].values
# create the dependent variable vector
y = dataset.iloc[:, 3:].values
# create imputater object then fit and transform missing values
x[:, 1:3] = Imputer(missing_values='NaN', strategy = 'mean', axis = 0).fit(x[:, 1:3]).transform(x[:, 1:3])
# create labelEncoder object to transform categorical values into integers
x[:, 0] = LabelEncoder().fit_transform(x[:, 0])
y = LabelEncoder().fit_transform(y)
# creating OneHotEncoder object to transform integer categorical values into dummy categorical
x = OneHotEncoder(categorical_features=[0]).fit_transform(x).toarray()
x_train,x_test,y_train,y_test = train_test_split(x,y, test_size = 0.2, random_state = 0)
