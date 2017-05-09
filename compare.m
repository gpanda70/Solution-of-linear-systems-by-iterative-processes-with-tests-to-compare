function [ ] = compare( A,b,x,n )
%compares the 3 different methods.
%A is 50x50 matrix that is positive definite, symmetric and diagonally
%dominant.
%b and x are vectors where Ax=b where we are solving for x so we set x as
%x=zeros(50,1) to keep it empty while we fill it for values in the gs,js
%and steepD methods.
%n is number of iterations.

%A=rand(50);
%A=A'*A + 1000*eye(50);
%b=rand(50,1);
%x=zeros(50,1);

fprintf( 'Running all 3 methods with %d iterations stopping at error 1e-5\n', n )
fprintf(['They will be tested with a random 50x50 matrix that' ...
      'is positive definite, symmetric and diagonally dominant\n\n'])
  

  
  A1=gs(A,b,n,x,1e-5);
  normg=norm(A*A1-b,Inf);
  fprintf('the norm is %d\n\n',normg)
  
  A2=js(A,b,n,x,1e-5);
  normj=norm(A*A2-b,Inf);
  fprintf('the norm is %d\n\n',normj)
  
  A3=steepD(A,b,n,x,1e-5);
  norms=norm(A*A3-b,Inf);
  fprintf('the norm is %d\n\n',norms)
  

end
