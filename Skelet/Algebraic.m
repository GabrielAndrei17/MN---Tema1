function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
  
  % Initializam vectorul R
  R = zeros(N);
  index = 0;
  
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
     
  T = eye(N) - d*M; 
 
  T = PR_Inv(T);
  
  R = T * ( (1 - d)/N ) * l;  

endfunction
