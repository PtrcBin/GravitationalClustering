%% performGravitationalClustering.m
% Gravitational Clustering Algorithm
% Date: 19/03/2018
% Copyright (c) Patricia Binder. All rights reserved.

function [numClusters_fin,clusCen_fin]=performGravitationalClustering(dataSamples,epsilon_r,minNeighb,numMarker,r_x)

flagPlot=1; % Set flag to 1 for plotting option

numSamples = length(dataSamples(1,:));
dim = length(dataSamples(:,1));



for timeindx=1:numSamples
    

      samples= dataSamples(:,1:timeindx);
       
      % Create moving mass unit for each new data sample

       if (exist('p')==0)
           numPart=0;
       else
           numPart = length(p);
       end
        x = genCluster(samples(:,end),r_x,numMarker,dim);
        Sx = size(x);
       
        for ii = 1:Sx(2)
            p(numPart+ii)=createParticle(1,x(:,ii)); 
        end
        

    
%% Perform data clustering for current time step

      p=performClustering(p, samples);
      
      
%% Combine mobile mass units
    
      p= combineParticles(p,epsilon_r);

     
%% PLOT  

if flagPlot==1
   numCenters=0;
   clusCen=[];
   clf
   hold on;
   
   if dim==2  %Plot 2D
   
       plot(samples(1,1:end),samples(2,1:end),'b*','Markersize',8);
       
       for i=1:length(p)
        if p(i).mass <= minNeighb
        plot(p(i).pos(1),p(i).pos(2),'ro','Markersize',8,'LineWidth',p(i).mass);
        end
        
        
        
        if p(i).mass > minNeighb
            numCenters=numCenters+1;
            
            if norm([-1 -1]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'cx','Markersize', 15,'LineWidth',5);
            elseif norm([6 -1]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'gx','Markersize', 15,'LineWidth',5);
            elseif norm([0 4]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'kx','Markersize', 15,'LineWidth',5);
            elseif norm([8 4]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'yx','Markersize', 15,'LineWidth',5);
            elseif norm([2 9]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'mx','Markersize',15,'LineWidth',5);
            elseif norm([-5 -10]'-p(i).pos)<=2
                plot(p(i).pos(1),p(i).pos(2),'rx','Markersize', 15,'LineWidth',5);
            end
                
            
            clusCen=[clusCen p(i).pos];
            
   
        end
       end
   end
 
   if timeindx >minNeighb *numMarker
       disp(['Number of clusters: ' num2str(numCenters)]);
       title(['Number of found clusters: ' num2str(numCenters)])
   end
 
    xlim([-15 20])
    ylim([-15 20])
    xlabel('Feature 1')
    ylabel('Feature 2')
    set(gca,'fontsize',16)
    pause(0.1)
    
     
else
    for i=1:length(p)
        if p(i).mass > minNeighb
            numCenters=numCenters+1;
            clusCen=[clusCen p(i).pos];
        end
    end
end  

numClusters_fin(1,timeindx)=numCenters;
clusCen_fin{1,timeindx}=clusCen;
 
end