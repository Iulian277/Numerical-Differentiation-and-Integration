function aprox = trapez_simplu(f, a, b)
  % Input:
  %       Functia f
  %       Intervalul de integrare [a, b]
  % Output:
  %       Valoarea aproximata a integralei
  
  % Trapez simplu: Interpolare liniara intre f(a) si f(b)
  % Deci, se foloseste polinomul de interpolare Lagrange de grad 1
  % Apoi se aproximeaza integrala cu aria trapezului
  
  % TODO: Pasul h - Trapez Simplu: h = ...
  
  
  % TODO: Aproximatie - Aplicare Formula: aprox = ...
  
  
  
  % Grafice
  clf;
  [X Y] = fplot(f, [a - 0.1, b + 0.1]);
  pf = plot(X, Y);
  hold on;
  
  pct1 = [a, f(a)];
  pct2 = [b, f(b)];
  
  scatter(pct1(1), pct1(2), 'r');
  scatter(pct2(1), pct2(2), 'r');
  
  % Interpolare Lagrange cu polinom de grad 1
  xx = linspace(a, b); % Generare 100 de puncte intre min(x)si max(x)
  for i = 1 : 100 % Calculare valoare in punctele xx
    yy(i) = lagrange([pct1(1) pct2(1)], [pct1(2) pct2(2)], xx(i));
  endfor
  p1 = plot(xx, yy); % Polinom de interpolare Lagrange
  
  % Marcare axa Ox
  plot([a - 0.1, b + 0.1], [0 0], '--g');
  
  % Completare trapez pe figura
  p2 = plot([a a], [max(f(a), 0) min(f(a), 0)], 'r');
  p3 = plot([b b], [max(f(b), 0) min(f(b), 0)], 'r');
  p4 = plot([a b], [0 0], 'r');
  
  hold off;
  
  h = [pf p1];
  leg = legend(h, 'Functia suport', 'Trapez simplu', 'location', 'northwest');
  set(leg, 'fontsize', 16);
  
  printf('Aproximatia - Trapez Simplu:  %d\n', aprox);
   
endfunction