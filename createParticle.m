function Particle = createParticle(mass,position)

Particle.mass = mass;
Particle.pos = position; 
Particle.velo = zeros(size(position)); 
Particle.force = zeros(size(position));
Particle.r_koeff = zeros(size(position)); 
Particle.dF = Particle.velo;

end