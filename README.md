# Solution-of-linear-systems-by-iterative-processes-with-tests-to-compare

you will run code with compare.m 

so try
A=rand(50);
A=A'*A + 1000*eye(50);
b=rand(50,1);
x=zeros(50,1);
n=100
compare(A,b,x,n)

SPD_Mat.m This function converts a non-positive definite symmteric matrix into a positive-definite matrix

isDiag.m checks if matrix is diagonally dominant

gs.m is the gauss-seidel method

js.m is the jacobi-seidel method

SteepD.m is the steepest descent method.
