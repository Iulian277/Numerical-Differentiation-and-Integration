function aprox = Simpson_compus(f, a, b, n)
  % Input:
  %       Functia f
  %       Intervalul de integrare [a, b]
  %       Numarul de puncte echidistante (2n)
  % Output:
  %       Valoarea aproximata a integralei
    

  % TODO: Pasul h - Simpson Compus: h = ...
  h = (b - a) / (2 * n); % De sters
  
  % TODO: 2n puncte echidistante: x = ...
  x = a + h : h : b - h; % De sters
  
  % TODO: Aproximatie - Aplicare Formula: aprox = ...
  aprox = h / 3 * (f(a) + f(b) + 4 * sum(f(x(1:2:2*n-1))) + 2 * sum(f(x(2:2:2*n-1))));
  % De sters
  
  
  % Grafice
  clf;
  [X Y] = fplot(f, [a - 0.1, b + 0.1]);
  pf = plot(X, Y);
  hold on;
  pause(0.5);
  

  
  scatter(a, f(a), 'r');
  scatter(b, f(b), 'r');
  scatter(x, f(x), 'r');
  
  % Interpolare Lagrange cu polinom de ordin 2 
  
  % Pornim de la 'a': Primul triplet de puncte
  xx = linspace(a, x(2)); % Generare 100 puncte intre a si x(2)
  for j = 1 : 100
    yy(j) = lagrange([a x(1) x(2)], [f(a) f(x(1)) f(x(2))], xx(j)); 
  endfor
  plot(xx, yy, 'r');
  
  for i = 2 : 2 : 2*n - 3
    xx = linspace(x(i), x(i+2)); % Generare 100 puncte intre x(i) si x(i+2)
    for j = 1 : 100
      yy(j) = lagrange([x(i) x(i+1) x(i+2)], [f(x(i)) f(x(i+1)) f(x(i+2))], xx(j)); 
    endfor
    plot(xx, yy, 'r');
  endfor
  
  % Pornim de la 'x(2n-3)': Ultimul triplet de puncte
  xx = linspace(x(2*n-2), b); % Generare 100 puncte intre x(2n-2) si b
  for j = 1 : 100
    yy(j) = lagrange([x(2*n-2) x(2*n-1) b], [f(x(2*n-2)) f(x(2*n-1)) f(b)], xx(j)); 
  endfor
  plot(xx, yy, 'r');
  
  % Marcare axa Ox
  plot([a - 0.1, b + 0.1], [0 0], '--g');
  
  % Completare trapez pe figura
  % Pentru primele 3 puncte
  p1 = plot([a x(2)], [0 0], 'r');
  pause(1/(2*n));
  plot([a a], [max(f(a), 0) min(f(a), 0)], 'r');
  pause(5/(2*n));
  
  % Pentru setul de puncte din interior
  for i = 2 : 2 : 2 * n - 3
    plot([x(i) x(i)], [max(f(x(i)), 0) min(f(x(i)), 0)], 'r');
    pause(1/(2*n));
    plot([x(i) x(i+2)], [0 0], 'r');
    pause(5/(2*n));
  endfor
  plot([x(2*n-2) x(2*n-2)], [max(f(x(2*n-2)), 0) min(f(x(2*n-2)), 0)], 'r');
  
  pause(5/(2*n));
  % Pentru ultimele 3 puncte
  plot([x(2*n-2) b], [0 0], 'r');
  pause(1/(2*n));
  plot([b b], [max(f(b), 0) min(f(b), 0)], 'r');
  
  hold off;
  
  h = [pf, p1];
  leg = legend(h, 'Functia suport', 'Simpson compus', 'location', 'northwest');  
  set(leg, 'fontsize', 16); 
    
  printf('Aproximatia - Simpson Compus: %d\n', aprox);
   
endfunction