#!/usr/bin/python

from sklearn.datasets import load_iris
irs = load_iris()
test = 
features = [[140, 1], [130, 1], [150, 0], [170, 0]] # Bumpy = 0, Smooth = 1
labels = [0, 0, 1, 1] # Apple = 0, Orange = 1
clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)
print (clf.predict([[160, 0]])) #It should print [1]
