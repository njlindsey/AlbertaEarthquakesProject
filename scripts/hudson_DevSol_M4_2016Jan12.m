
%Double-couple
Mxx=1.356E+21;
Mxy=-5.250E+21;
Mxz=-1.039E+21;
Myy=-7.134E+20;
Myz=7.712E+20;
Mzz=-6.422E+20;

n=1;
for i=1:n

% %add crack
% Mxx=i*1.;
% Mxy=50;
% Mxz=0.;
% Myy=i*3.;
% Myz=0.;
% Mzz=i*1.;

A=[Mxx Mxy Mxz; Mxy Myy Myz; Mxz Myz Mzz];

% Source-type parameters
e = eig(A); % defined previously
miso = sum(e)/3;
mdev = e-miso;
[mdevs,is] = sort(abs(mdev));
mdev = mdev(is);
% T,k are source-type parameters
T(i) = (2*mdev(1))/abs(mdev(3));
k(i) = miso/(abs(miso)+abs(mdev(3)));
%tau = T*(1-abs(k));
%if (tau*k < 0) % Second and fourth quadrants
%    a = 0;
%elseif (tau > 0 || k > 0) % First quadrant
%    if (tau < 4*k); a = -0.5*tau; else a = -2*k; end
%else % Third quadrant
%    if (tau < 4*k); a = 2*k; else a = 0.5*tau; end
%end
%% u,v are linear parameters of T,k (for plotting on x,y)
%u = tau/(1 + a)
%v = k/(1 + a)
stplot_sub(T(i),k(i))
end




