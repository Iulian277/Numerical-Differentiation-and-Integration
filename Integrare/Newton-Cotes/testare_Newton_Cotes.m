function [] = testare_Newton_Cotes()
  
  format long;
  
  % Functia de integrat
	f = @(x) exp(x);
  
  % Intervalul de integrat
  a = 1;
  b = 3;
  
  % Numarul de subintervale
  n = 4;
  
  printf('Valoarea exacta a integralei: %d\n\n', quad(f, a, b));
  
  trapez_simplu = trapez_simplu(f, a, b);
  pause(3);
  clf;
  
  trapez_compus = trapez_compus(f, a, b, n);
  pause(3);
  clf;
  
  simpson_simplu = Simpson_simplu(f, a, b);
  pause(3);
  clf;
  
  simpson_compus = Simpson_compus(f, a, b, n);
  
endfunction