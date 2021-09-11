function aprox = trapez_compus(f, a, b, n)
  % Input:
  %       Functia f
  %       Intervalul de integrare [a, b]
  %       Numarul de puncte echidistante (n)
  % Output:
  %       Valoarea aproximata a integralei
  
  
  % TODO: Pasul h - Trapez Compus: h = ...
  
  
  % TODO: n puncte echidistante: x = ...
  
  
  % TODO: Aproximatie - Aplicare Formula: aprox = ...
  
  
  
  % Grafice
  clf;
  [X Y] = fplot(f, [a - 0.1, b + 0.1]);
  pf = plot(X, Y);
  hold on;
  pause(0.5);
  
  scatter(a, f(a), 'r');
  scatter(b, f(b), 'r');
  scatter(x, f(x), 'r');
  
  % Marcare axa Ox
  plot([a - 0.1, b + 0.1], [0 0], '--g');
  
  % Completare trapez pe figura
  % Pentru primele 2 puncte
  p1 = plot([a x(1)], [0 0], 'r');
  plot([a x(1)], [f(a) f(x(1))], 'r');
  pause(1/(2*n));
  plot([a a], [max(f(a), 0) min(f(a), 0)], 'r');
  pause(5/(2*n));

  % Pentru setul de puncte din interior
  for i = 1 : n - 2
    plot([x(i) x(i+1)], [f(x(i)) f(x(i+1))], 'r');
    plot([x(i) x(i)], [max(f(x(i)), 0) min(f(x(i)), 0)], 'r');
    pause(1/(2*n));
    plot([x(i) x(i+1)], [0 0], 'r');
    pause(5/(2*n));
  endfor
  plot([x(n-1) x(n-1)], [max(f(x(n-1)), 0) min(f(x(n-1)), 0)], 'r');
  
  pause(5/(2*n));
  % Pentru ultimele 2 puncte
  plot([x(n-1) b], [0 0], 'r');
  plot([x(n-1) b], [f(x(n-1)) f(b)], 'r');
  pause(1/(2*n));
  plot([b b], [max(f(b), 0) min(f(b), 0)], 'r');
  
  hold off;
  
  h = [pf p1];
  leg = legend(h, 'Functia suport', 'Trapez compus', 'location', 'northwest');
  set(leg, 'fontsize', 16);
 
  printf('Aproximatia - Trapez Compus:  %d\n', aprox);
    
endfunction