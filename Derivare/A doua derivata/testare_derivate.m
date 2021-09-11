function [] = testare_derivate()
   
   a = 2;
   b = 3;
   x0 = [a : 0.5 : b]; % Abscisele unde se vor aproxima derivatele II
  
   h = 0.1; % Pasul
  
	 f = @(x) x .* exp(x); % Functie de derivat
   d2f = @(x) (x+2) .* exp(x); % Derivata de ordin 2 a functiei
	
   for i = 1 : length(x0)
     % Valoarea exacta a derivatei de ordin 2 in punctele x0(i) 
		 deriv_exacta(i) = d2f(x0(i)); 

		 % Valorile aproximative ale derivatei in punctele x0(i)
		 f_ThreePoints(i) = ThreePoints(f, x0(i), h);
    
     printf("Punctul: x = %d\n", x0(i));
     printf("Derivata a II-a exacta: f''(%d) = %d\n", x0(i), deriv_exacta(i));
     printf("ThreePoints: d2f_aprox(%d) = %d\n", x0(i), f_ThreePoints(i));
     printf("\n");
	 endfor
  
endfunction