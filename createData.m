function s = createData(NI, pout)

sigma1 = [.2 0 ; 0 0.7];
sigma2 = [1.0 0 ; 0 .1];
sigma3 = [.4 0 ; 0 .4];
sigma4 = [.2 0 ; 0 .2];
sigma5 = [.8 0 ; 0 .8];

mu1=[-1 -1]+(rand(1,2)-0.5).*2 .* [1 1];
mu2=[6 -1]+(rand(1,2)-0.5)*2 .* [1 1];
mu3=[0 4]+(rand(1,2)-0.5)*2 .* [1 1];
mu4=[8 4]+(rand(1,2)-0.5)*2 .* [1 1];
mu5=[2 9]+(rand(1,2)-0.5)*2 .* [1 1];
mu6=[-5 -10]+(rand(1,2)-0.5)*2 .* [1 1];
dim=length(mu1);
s=[genClusterWithOutlier(mu2,sigma2,NI,pout,dim),...
   genClusterWithOutlier(mu3,sigma3,NI,pout,dim),...
   genClusterWithOutlier(mu4,sigma4,NI,pout,dim),...
   genClusterWithOutlier(mu5,sigma5,NI,pout,dim)];

% Square Cluster
s_v=[];

for i=-2:0.5:0
    for j=-2:0.5:0
        tmp=[i;j];
        s_v=[s_v tmp];
    end
end

s=[s s_v];
s=s(:,randperm(length(s(1,:))));

% Later appearing cluster 
NI=15;

  s2=[genClusterWithOutlier(mu2,sigma2,NI,pout,2),...
      genClusterWithOutlier(mu3,sigma3,NI,pout,2),...
      genClusterWithOutlier(mu4,sigma4,NI,pout,2),...
      genClusterWithOutlier(mu5,sigma5,NI,pout,2),...
      genClusterWithOutlier(mu6,sigma5,20,pout,2)];
  
 s_v=[];
  for i=-2:0.5:0
    for j=-2:0.5:0
        tmp=[i;j];
        s_v=[s_v tmp];
    end
end
  s2=[s2 s_v];

  s2=s2(:,randperm(length(s2(1,:))));
  s=[s s2];

end

