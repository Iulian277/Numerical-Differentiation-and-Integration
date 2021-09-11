function [df pf p2points] = TwoPoints(f, x0, h)
   % Input:
   %       Functia f
   %       Punctul (x0) in care trebuie sa aproximez prima derivata a lui f
   %       Pasul h
   % Output:
   %        Valoarea aproximata (y0) a derivatei lui f in x0
   %        2 ploturi pentru legenda
   
   
   % TODO: df = Formula TwoPoints: df = ...
   
   
   
   % Grafice
   [X Y] = fplot(f, [x0 - 0.1, x0 + 0.1]);
   pf = plot(X, Y, 'b');
   hold on;

   % Tangenta aproximata in punctul x0 (Derivata 1)
   p = [df f(x0)];

   dist = f(x0) - (p(1) * x0 + p(2));
   p(2) += dist;

   x = linspace(x0 - 0.175, x0 + 0.175);
   y = p(1) * x + p(2);

   p2points = plot(x, y, '--g');

   scatter(x0, f(x0), 'r');
  
endfunction
