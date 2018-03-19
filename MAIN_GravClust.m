%% MAIN_GravClust.m
% Gravitational Clustering Algorithm
% Date: 19/03/2018
% Copyright (c) Patricia Binder. All rights reserved.
% For details, see article: https://authors.elsevier.com/a/1WjYAbZX4vgFc

% OUTPUT:
% numClusters: number of found clusters
% clusCen: Found cluster centroids

close all;
clear all;


%% User Input
epsilon_r = 1; % distance within which mobile mass units are combined
numMarker = 1; % number of mobile mass units which are created per data sample
minNeighb = 7; % Minimum mass a mobile mass unit needs in order to determine a cluster (m_min)
pout = 0.13; % percentage of outlying data
NI = 20; % number of samples per cluster
r_x = 2  ; % radius around a sample where mobile mass units are injected


%% Create Data
d=createData(NI, pout);


%% Perform Gravitational Clustering
[numClusters, clusCen]=performGravitationalClustering(d,epsilon_r,minNeighb,numMarker,r_x);
