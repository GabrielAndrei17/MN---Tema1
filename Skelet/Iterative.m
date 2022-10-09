function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  v = textread(nume,"%f"); % Vom parcurge citi fisierul cu textread si vom accesa cu index elementele
     
  N = v(1); % Numarul de pagini
  
  A = zeros(N); % Matricea de adiacenta
  L(1:N) = 0; % L(i) numarul de linkuri detinute de pagina i
  
  index = 3;
  
  %creez matricea de adiacenta 
  for i = 1:N
    
    n = v(index); % Numarul de pagini adiacente
    index++;
    for j = 1:n
      
        if i ~= v(index)
          A(i,v(index)) = 1;
        endif
        
        index++;
    endfor
   index++;
  endfor
  

  % Numarul de linkuri pentru fiecare pagina
  for i = 1:N
    for j = 1:N
      if A(i,j) == 1 && i ~= j
        L(i)++;
      endif
    endfor
  endfor  
  
  
  % Initializam matricea R
  R = ones(N);
  R = (1/N)*R;
  Raux = R;
  
  % Se calculeaza matricea stochastica M
  M = A;
  for i = 1:N
    for j = 1:N
      if M(i,j) == 1 && i ~= j
        M(i,j) = M(i,j) / L(i);
      endif
    endfor
  endfor

  l(1:N) = 1;
  l = l'; % vector de 1
  M = M';
  
  while 1
    R = d * M * Raux + (1 - d)/N*l;
    if norm(R - Raux) < eps
      break
    endif
  R2 = Raux;  
  Raux = R;  
endwhile  

  R = R2(1:N, 1); % se ia prima coloana

endfunction
