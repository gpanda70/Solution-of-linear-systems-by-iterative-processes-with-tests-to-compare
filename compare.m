function [ ] = compare( A,b,x,n )
%compares the 3 different methods
fprintf( 'Running all 3 methods with %d iterations stopping at error 1e-5\n', n )
fprintf(['They will be tested with a random 50x50 matrix that' ...
      'is positive definite, symmetric and diagonally dominant\n\n'])
  
 % A=rand(100);
  %A=A'*A + 1000*eye(100);
  %b=rand(100,1);
  %x=zeros(100,1);
  
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

