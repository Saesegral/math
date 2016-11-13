%Replacement mod function that puts emphasis on digits closer to 1s place.
function modPow = modPow(n, pow, modulus)
	%find inverse if negative exponent
	if pow < 0
		for inv = 2:modulus-1
			if(mod(inv*n, modulus) == 1)
				n = inv;
				break
			end
		end
	end
	
	modPow = mod(n, modulus);
	
	%compute exponent
	for k=2:abs(pow)
		modPow = mod(modPow*n,modulus);	
	end
	
	%return 1 if 0 exponent, returns 0^0=1 by default, something to consider changing/fixing.
	if pow == 0
		modPow = 1;
	end
end

p = 17;
digits = 6;

%Converts decimal digits of accuracy into base p digits of accuracy
pdigit = ceil( digits / log10(p));

% Find smallest generating root

root=1;
solutionFound = false;
while solutionFound == false
	root++;
	k=2;
	while modPow(root,k,p) ~= 1
		k++;
		if(k==p-2)
			solutionFound = true;
		end
	end
end

rootinv=modPow(root,-1,p);

F = [];
for m=0: p-2
	for n=0 : p-2
		F(m+1,n+1) = modPow(root,m*n,p);
	end
end

G=[];
for m=0: p-2
	for n=0 : p-2
		G(m+1,n+1) = modPow(rootinv,m*n,p);
	end
end

%displays generating root and its inverse
disp(['root = ', num2str(root)])
disp(['rootinv = ', num2str(rootinv)])

disp('F');
disp(F);

disp('G');
disp(G);

disp(['(p-1)^-1 = ',num2str(modPow(p-1,-1,p))]);

disp('FG/(p-1)');
disp(mod(modPow(p-1,-1,p)*F*G,p));