function Particle = createParticle(mass,position)

Particle.mass = mass;
Particle.pos = position;
Particle.compPos=position; %Vergleichsposition vor einigen Zeitschritten --> Prüfung auf Bewegung
Particle.velo = zeros(size(position)); %velocity
Particle.force = zeros(size(position));
Particle.r_koeff = zeros(size(position)); %Reibungskoeffizient
Particle.dF = Particle.velo;
Particle.subP=[]; %Wenn mehrere Partikel zu einem kombiniert werden, werden diese hier gespeichert

end