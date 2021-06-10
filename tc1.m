X = rand(10000);
Y = rand(10000);
for i = 1:3
	tic
	out=X(:)'*Y(:); 
	toc
	tic
	out=sum(X.*Y );
	toc
end

