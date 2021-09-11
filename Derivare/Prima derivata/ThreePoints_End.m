function [df p3pointsEnd] = ThreePoints_End(f, x0, h)
   % Input:
   %       Functia f
   %       Punctul (x0) in care trebuie sa aproximez prima derivata a lui f
   %       Pasul h
   % Output:
   %        Valoarea aproximata (y0) a derivatei lui f in x0
   %        1 plot pentru legenda
   
   
   % TODO: df = Formula ThreePointsEnd
   df = 0; % De sters
   
   
   % Tangenta aproximata in punctul x0 (Derivata 1)
   p = [df f(x0)];
 
   dist = f(x0) - (p(1) * x0 + p(2));
   p(2) += dist;
  
   x = linspace(x0 - 0.15, x0 + 0.15);
   y = p(1) * x + p(2);
  
   p3pointsEnd = plot(x, y, '--k');
  
endfunction