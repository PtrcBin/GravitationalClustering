function F=calcF(x,x_mass,x2,x2_mass)

q=log10(norm(x-x2)+1)+2;

r_diff = x-x2;
r_diff_n = norm(r_diff);

F = x_mass*x2_mass* (r_diff)./r_diff_n.^q;

end