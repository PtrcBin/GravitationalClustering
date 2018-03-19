%% genClusterWithOutlier.m
% Gravitational Clustering Algorithm
% Date: 19/03/2018
% Copyright (c) Patricia Binder. All rights reserved.
% For details, see article: https://authors.elsevier.com/a/1WjYAbZX4vgFc

function XA = genClusterWithOutlier(mu,sigma,N,percentage,dim)

X=genCluster(mu.',sigma,N,dim); 

if percentage == 0
    XA=X;
    XA(dim+1,:)=zeros(1,length(XA(1,:)));
else
    A=rand(1,N);
    B=A>=(1-percentage);
    tmp=X(:,B==1);
    if ~isempty(tmp)
        XA(:,B==1)=tmp+genCluster(zeros(dim,1),3*eye(dim,dim),length(tmp(1,:)),dim);
        XA(:,B==0)=X(:,B==0);
    else
        XA=X ;
    end
end
end


