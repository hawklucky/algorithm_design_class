function t = matlabmatrix()

    global A B 
    tic;
    C = A * B;
    t = toc;
    
end
