%{
This tells you if a p-adic number satisfying f(n)=0 exists, and if any do, it finds all of them for you (there may be more than one). It then prints the numbers in base 10 and base p.

Define f(n), g(n), p, and digits

f(n) as some polynomial.

g(n) as the derivative of that polynomial (lolol sorry, I'm sure there's a way to do it in the program but not gonna waste my time on that. I'm on Octave, maybe you can figure it out and help)

p as some prime number

digits of accuracy (in base p)


Fun fact, the p-adics contain all the (p-1) roots of unity, so something to test out.
%}

function f = f(n)
	f=n^2+1;
end

function derivativef = g(n)
	derivativef=2*n;
end

p = 5;
digits = 10;

%%%%%%%%%%%%%%%%


%Hensel's Lemma, looks for what solutions there are
x=[];	
for n = 0:p-1
	if (mod(f(n),p) == 0 && mod(g(n),p)~=0)
		x=[x,n];
	end
end

%Constructs the p-adic number(s) that satisfy f(n)=0
for a = 1:length(x)
	m=x(a);
	for k = 1: digits-1
		for n = 0:p-1
			if (mod(f(m+n*p^k),p^(k+1)) == 0)
				m+=n*p^k;
				break
			end
		end
	end
	x(a)=m;
end

disp('in base 10');
disp(x);
disp(['in base ', num2str(p)]);
disp(dec2base(x,p,digits));
