%% combineParticles.m
% Gravitational Clustering Algorithm
% Date: 19/03/2018
% Copyright (c) Patricia Binder. All rights reserved.

function p= combineParticles(p,epsilon)

 distMat=zeros(length(p));
 particleDeletion = [];
 particleSurvivor=[];
     for j=1:length(p)
         for i = 1:length(p)
         distMat(j,i)=norm(p(j).pos-p(i).pos);
         end
     end
     meanDist = mean(distMat);
     distMat(distMat==0) = inf;
minVal = min(min(distMat));


while(minVal < epsilon) 


    idx = find(distMat == minVal); %Position of elements in distance matrix
    idx=mod(idx,length(p));
    idx(find(idx==0))=length(p);

    % check the minimum distance of the potential pair of two particles to
    % all others
    minMeanDist = min(meanDist(idx)); %keep the particle with the minimum distance to others -> higher probability for converging in future
    minMeanDistIdx = find(meanDist == minMeanDist);  
    
    if length(idx)==1 
        deleteIdx = idx(idx~=minMeanDistIdx);
        winnerIdx = idx(idx==minMeanDistIdx);
    else
        deleteIdx = idx(1);
        winnerIdx = idx(2);
    end
    
    particleDeletion = [particleDeletion deleteIdx];
    particleSurvivor = [particleSurvivor winnerIdx];
    distMat(deleteIdx,:) = inf;
    distMat(:,deleteIdx) = inf;
    minVal = min(min(distMat));
end
    
% Update/ delete combined mobile mass units 
for i=1:length(particleDeletion)
    p(particleSurvivor(i)).mass = p(particleDeletion(i)).mass +p(particleSurvivor(i)).mass;
    p(particleSurvivor(i)).subP=[p(particleSurvivor(i)).subP p(particleDeletion(i))];
end

p=p(setdiff([1:length(p)],particleDeletion)); 

end