function [x] = gs( A,b,M,xi,TOL)
%this is the gauss-seidel method
%A is the matrix, b is a given vector, M is number of iterations,xi is
%given beginning vector.
%Tol is the tolerance

x=xi;
n=length(A);
if length(x)~=n
    msg = ['Error occurred. The length of your initial guess is ' ... 
        'different from the length of your A matrix or b, re-enter value']; 
    error(msg)
end
%this loop is the iteration loop
for k=1:M
    %xold=x;
    h=zeros(n,1); % place holder for summation
    
    %this double for loop does the math
    for i=1:n
        for j=1:n
            if i==j
                continue;
            else
                x(i)=h(i)+(-A(i,j)*x(j))/A(i,i);
                h(i)=x(i);
            end
        end
        x(i)=(b(i)/A(i,i))+h(i); % the summed up aij*xj are added to bi
   
    end
    %this loop checks error tolerance and breaks out of loop once a certain
    %Tolerance is reaches
    if abs(norm(A*x-b,inf)) < TOL
        
        break;
    end
   
end
fprintf( 'Gauss-seidel stops after %d iterations!\n', k ) 
end

