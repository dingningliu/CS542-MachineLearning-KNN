# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd
import operator
import numpy as np

trainingData = pd.read_csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_training', header = None)
testingData = pd.read_csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_testing', header = None)

#get the distance for each in test
def distance_L2(test,train):
    d = 0
    l = len(train) - 1
    for i in range(l):
        if type(test[i]) == str :   #if it's a string, d=0 if same, d=1 if different
            if test[i] == train[i]:
                d += 1
            else:
                d += 0
        else:                     
            d += pow(test[i]-train[i],2)    #if it's a numeric value
    return (pow(d,0.5),train[l])      #distance between train and test data tag with label of that train

#predict the label of testing data
#find k shortest distances, count frequency of each label
#choose the label with biggest frequencies as the predicted label
def klable(klist):
    lable_dic = {}
    for i in range(len(klist)):
        if (klist[i][1] not in lable_dic):
            lable_dic[klist[i][1]] = 1
        else:
            lable_dic[klist[i][1]] += 1
    return max(lable_dic.items(), key=operator.itemgetter(1))[0]

num = len(testingData.loc[0])   #number of variables
testingData[num] = 1    #add a column to record the predicted label
num_testing = len(testingData)
num_training = len(trainingData)

k = 3
for i in range(num_testing):
    dis_list = []
    for j in range(num_training):
        dis_list.append(distance_L2(testingData.loc[i],trainingData.loc[j]))
    dis_list = sorted(dis_list)
    klist = dis_list[0:k]
    testingData[num][i] = klable(klist)
    
testingData.to_csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_testing_pred', header = False, index = False, quoting = None)


#test the accuracy
testing = pd.read_csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_testing_pred', header = None)

num_test = len(testing.loc[0])

rightNum = sum(testing[num_test - 2] == testing[num_test - 1])
print(rightNum / len(testing))













