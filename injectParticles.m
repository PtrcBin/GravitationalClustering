function C = injectParticles(mu,sigma,N,dim)
C = sigma*randn(dim,N);
    for i = 1:N
        C(:,i) = C(:,i) + mu;
    end
end