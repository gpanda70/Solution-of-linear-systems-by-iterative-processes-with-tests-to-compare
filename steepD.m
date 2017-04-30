function [ xi] = steepD( A,b,M,x,TOL )
%This is the steepest descent method
%A is matrix, b is vector on right side, M is number of iteration, x is
%inital vector

v=zeros(length(A),1);

for i=1: M
    xold=x;
    v=b-A*x;
    tk=dot(v,v)/(dot(v,A*v));
    x=x+tk*v;
    if abs(norm(A*x-b,inf)) < TOL
        
        break;
    end
end
fprintf( 'Steepest Descent stops after %d iterations!\n', i ) 
xi=x;

end

