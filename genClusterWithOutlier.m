function XA = genClusterWithOutlier(mu,sigma,N,percentage,dim)

X=injectParticles(mu.',sigma,N,dim); %create a cluster with given mean and standard deviation

if percentage == 0
    XA=X;
    XA(dim+1,:)=zeros(1,length(XA(1,:)));
else
    A=rand(1,N);
    B=A>=(1-percentage);
    tmp=X(:,B==1);
    if ~isempty(tmp)
        XA(:,B==1)=tmp+injectParticles(zeros(dim,1),3*eye(dim,dim),length(tmp(1,:)),dim);
        XA(:,B==0)=X(:,B==0);
    else
        XA=X ;
    end
end
end


