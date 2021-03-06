# GravitationalClustering

Gravitational Clustering algorithm based on the article "Gravitational Clustering: A Simple, Robust and Adaptive Approach for Distributed Networks" by Binder, Muma and Zoubir. 

The key idea is to exploit the physical principle of gravitational force between mass units: streaming-in feature vectors are considered as mass units of fixed position in the feature space, around which mobile mass units are injected at each time instant. The cluster enumeration takes advantage of the fact that the highest attraction on the mobile mass units is exerted by regions with a high density of feature vectors, i.e., gravitational clusters.

By executing the main file RUN_Demo.m, the algorithm is run on a clustering example which reproduces Figure 1 of the original article. 

For details, see article: https://www.sciencedirect.com/science/article/pii/S0165168418300902
