%% performClustering.m
% Gravitational Clustering Algorithm
% Date: 19/03/2018
% Copyright (c) Patricia Binder. All rights reserved.


function [p]= performClustering(p, samples)   

t = 1; % set time step

% calculate force acting on each single mobile mass unit    
    for i=1:length(p)
        
        F = zeros(size(samples));  
      
        for l = 1:length(samples(1,:))          
           F(:,l) = calcF(samples(:,l),1,p(i).pos,p(i).mass);
        end

        p(i).force=sum(F.');


        % Determine damping parameter
        k = .1;
        k_0=0.3;
        k_d=5;
        p(i).r_koeff= 3; % f_damp
        
        
        F_d = -(p(i).velo).'.*p(i).r_koeff.';
        
        % constraint to limit maximum force (f_damp calculated based on
        % LAST time step --> account for current forces)
        if(norm(F_d)>.8.*norm(p(i).velo))
            F_d = -.8.*p(i).velo.';  
        end
        if(norm(p(i).force) >.3)
           p(i).force = p(i).force./norm(p(i).force) * .3; 
        end
        
        d = (p(i).force+F_d).';
       
        p(i).dF = d; % assign force
        p(i).velo = p(i).velo+(p(i).dF).*t; % assign velocity
        p(i).pos=p(i).pos+p(i).velo*t; %assign new position
       
    end 
end
  
  
  