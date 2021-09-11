function [] = testare_derivate()
  
   clf;
   
   a = 2;
   b = 3;
   x0 = [a : 0.5 : b]; % Abscisele unde se vor aproxima derivatele
   
   h = 0.01; % Pasul
   
   f = @(x) exp(2.*x); % Functie de derivat
   df = @(x) 2.*exp(2.*x); % Derivata functiei

   best_method = zeros(1, 3); % 3 metode
   for i = 1 : length(x0)
     % Valoarea exacta a derivatei in punctele x0(i) 
     deriv_exacta(i) = df(x0(i)); 

     % Valorile aproximative ale derivatei in punctele x0(i)
     [f_TwoPoints(i) pf p2points] = TwoPoints(f, x0(i), h);
     [f_ThreePoints_Mid(i) p3pointsMid] = ThreePoints_Mid(f, x0(i), h);
     [f_ThreePoints_End(i) p3pointsEnd] = ThreePoints_End(f, x0(i), h);
   endfor

   h = [pf p2points p3pointsMid p3pointsEnd];
   legend(h, 'Functia suport',
         'Derivata - TwoPoints', 
         'Derivata - ThreePointsMid',
         'Derivata - ThreePointsEnd');

   % Calculul erorii
   best_method(1) = norm(f_TwoPoints - deriv_exacta);
   best_method(2) = norm(f_ThreePoints_Mid - deriv_exacta);
   best_method(3) = norm(f_ThreePoints_End - deriv_exacta);
   errors = best_method'

   [best idx] = min(best_method); 
   printf("Cea mai buna metoda - Pentru functia suport - Metoda nr. %d\n", idx);
    
endfunction