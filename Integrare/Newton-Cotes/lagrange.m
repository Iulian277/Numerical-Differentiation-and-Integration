function y0 = lagrange(x, y, x0)
  % Input: 
  %        Coordonatele punctelor din suportul de interpolare (x, y)
  %        Punctul (x0) in care dorim sa aflam valoarea dupa interpolare
  % Output:
  %        Valoarea (y0) in punctul dorit (x0)
  
  y0 = 0;
  L = ones(length(x), 1); % Multiplicator Lagrange
  % Calculare polinom de interpolare Lagrange
  for i = 1 : length(x)
    
    % Calculare multiplicator Lagrange
    for j = 1 : length(x)
      if(i != j)
        L(i, :) = L(i, :) .* ((x0 - x(j)) / (x(i) - x(j)));
      endif
    endfor
    
    y0 = y0 + y(i) * L(i, :);
  endfor
    
endfunction