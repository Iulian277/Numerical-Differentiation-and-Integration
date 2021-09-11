function aprox = Simpson_simplu(f, a, b)
  % Input:
  %       Functia f
  %       Intervalul de integrare [a, b]
  % Output:
  %       Valoarea aproximata a integralei
  
  % Simpson simplu: Interpolare patratica intre f(a) si f(b)
  % Partea de sus a trapezului ('capacul') este inlocuita cu o parabola
  % Deci, se foloseste polinomul de interpolare Lagrange de grad 2
  
  % TODO: Pasul h - Simpson Simplu: h = ...
  h = (b - a) / 2; % De sters
  
  % TODO: Aproximatie - Aplicare Formula: aprox = ...
  aprox = h / 3 * (f(a) + 4 * f((a + b) / 2) + f(b)); % De sters
  
  
  % Grafice
  clf;
  [X Y] = fplot(f, [a - 0.1, b + 0.1]);
  pf = plot(X, Y);
  hold on;
  
  pct1 = [a, f(a)];
  pct2 = [(a + b) / 2, f((a + b) / 2)];
  pct3 = [b, f(b)];
  
  scatter(pct1(1), pct1(2), 'r');
  scatter(pct2(1), pct2(2), 'r');
  scatter(pct3(1), pct3(2), 'r');
  
  % Interpolare Lagrange cu polinom de grad 2
  xx = linspace(a, b); % Generare 100 de puncte intre a si b
  for i = 1 : 100
    yy(i) = lagrange([pct1(1) pct2(1) pct3(1)], [pct1(2) pct2(2) pct3(2)], xx(i)); % Calculare valoare in punctele xx
  endfor
  p1 = plot(xx, yy);
  
  % Marcare axa Ox
  plot([a - 0.1, b + 0.1], [0 0], '--g');
  
  % Completare trapez pe figura
  p2 = plot([a a], [max(f(a), 0) min(f(a), 0)], 'r');
  p3 = plot([b b], [max(f(b), 0) min(f(b), 0)], 'r');
  p4 = plot([a b], [0 0], 'r');
    
  hold off;
 
  h = [pf, p1];
  leg = legend(h, 'Functia suport', 'Simpson simplu', 'location', 'northwest');
  set(leg, 'fontsize', 16);
  
  printf('Aproximatia - Simpson Simplu: %d\n', aprox);
    
endfunction