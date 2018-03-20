%% MAIN_GravClust.m
% Gravitational Clustering Algorithm

% Copyright (c) 2018 Patricia Binder. All rights reserved.

% For details, see article: https://authors.elsevier.com/a/1WjYAbZX4vgFc

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Affero General Public License as published
% by the Free Software Foundation, version 3 of the License.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Affero General Public License for more details.

% You should have received a copy of the GNU Affero General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


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
