function flag = isDiag( A, strOpt )


    if nargin == 1
        strOpt = ''; % by default check only for diagonal dominance
    elseif nargin ~= 2
        error('domdiag: invalid input parameters');
    end
    
    [ m , n ] = size(A);
    if m ~= n
        error('domdiag: input matrix must have dimension rows==cols');
    end

    % magnitude of the diagonal
    absDiag  = abs(diag(A));
    
    % sum of the magnitude of the elements of each row exept the diagonal
    % element
    absElem = sum(abs(A), 2) - absDiag;
    
    % check if each row has diagonal magnitude greater or equal to the sum 
    % of magnitudes of its other values
    flag = all(absElem <= absDiag);
    
    % check if each row has diagonal magnitude greater or equal to the sum 
    % of magnitudes of its other values, and at least the magnitude of one
    % diagonal element is greater than the sum of the magnitudes of the
    % other elements of that row
    if strcmpi(strOpt, 'strict') && flag == true
        flag = any(absElem  < absDiag);
    end
    
end