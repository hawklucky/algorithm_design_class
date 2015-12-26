function t = matrixdefine()

    global A B 
    len = size(A,1);
    C = zeros( len );
    
    tic;
    for j = 1 : len 
        for l = 1 : len %½»»»kºÍl --> loop permutation
            for k = 1 : len 
                C(j,k) = C(j,k) + A(j,l) * B(l,k);
            end
        end
    end
    t = toc;


end
