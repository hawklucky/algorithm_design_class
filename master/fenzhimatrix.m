function  t = fenzhimatrix()
    
    global A B 
    len = size(A,1);
    C = zeros(len);
    
    tic;
    C = fenzhiC(A,B,size(A,2));
    %C = fenzhi(A,B);
    t = toc;
end


function c = fenzhi(a,b)
    
    c = zeros( size(a) );
    if size(a,1)==2         
        c(1,1) = a(1,1) * b(1,1) + a(1,2) * b(2,1);
        c(1,2) = a(1,1) * b(1,2) + a(1,2) * b(2,2);
        c(2,1) = a(2,1) * b(1,1) + a(2,2) * b(2,1);
        c(2,2) = a(2,1) * b(1,2) + a(2,2) * b(2,2);
    else
        c(1:size(c,1)/2, 1:size(c,2)/2) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, 1:size(b,2)/2 ) ) + fenzhi( a(1:size(a,1)/2, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, 1:size(b,2)/2 ) );
        c(1:size(c,1)/2, size(c,2)/2+1:end) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, size(b,2)/2+1:end ) ) + fenzhi( a(1:size(a,1)/2, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, size(b,2)/2+1:end ) );        
        c(size(c,1)/2+1:end, 1:size(c,2)/2) = fenzhi( a(size(a,1)/2+1:end, 1:size(a,2)/2 ), b(1:size(b,1)/2, 1:size(b,2)/2 ) ) + fenzhi( a(size(a,1)/2+1:end, size(a,2)/2+1:end ), b(1:size(b,1)/2, size(b,2)/2+1:end ) );
        c(size(c,1)/2+1:end, size(c,2)/2+1:end) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, size(b,2)/2+1:end ) ) + fenzhi( a(size(a,1)/2+1:end, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, size(b,2)/2+1:end ) );
    end
end






% function n = extract(m,k,l)
%     n = zeros( size(m,1)/2, size(m,2)/2 );
%     p = [num2str(k) num2str(l)];
%     switch p
%         case '11'
%             n = m( 1:size(m,1)/2, 1:size(m,2)/2 ); 
%         case '12'
%             n = m( 1:size(m,1)/2, size(m,2)/2+1:end );
%         case '21'
%             n = m( size(m,1)/2+1:end, 1:size(m,2)/2 ); 
%         case '22'
%             n = m( size(m,1)/2+1:end, size(m,2)/2+1:end );
%         otherwise
%             disp('Error Occured!')
%     end
% end




%         c(1:size(c,1)/2, 1:size(c,2)/2) = fenzhi( extract(a,1,1), extract(b,1,1) ) + fenzhi( extract(a,1,2), extract(b,2,1) );
%         c(1:size(c,1)/2, size(c,2)/2+1:end) = fenzhi( extract(a,1,1), extract(b,1,2) ) + fenzhi( extract(a,1,2), extract(b,2,2) );       
%         c(size(c,1)/2+1:end, 1:size(c,2)/2) = fenzhi( extract(a,2,1), extract(b,1,1) ) + fenzhi( extract(a,2,2), extract(b,2,1) );
%         c(size(c,1)/2+1:end, size(c,2)/2+1:end) = fenzhi( extract(a,2,1), extract(b,1,2) ) + fenzhi( extract(a,2,2), extract(b,2,2) );

%         c(1:size(c,1)/2, 1:size(c,2)/2) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, 1:size(b,2)/2 ) ) + fenzhi( a(1:size(a,1)/2, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, 1:size(b,2)/2 ) );
%         c(1:size(c,1)/2, size(c,2)/2+1:end) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, size(b,2)/2+1:end ) ) + fenzhi( a(1:size(a,1)/2, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, size(b,2)/2+1:end ) );        
%         c(size(c,1)/2+1:end, 1:size(c,2)/2) = fenzhi( a(size(a,1)/2+1:end, 1:size(a,2)/2 ), b(1:size(b,1)/2, 1:size(b,2)/2 ) ) + fenzhi( a(size(a,1)/2+1:end, size(a,2)/2+1:end ), b(1:size(b,1)/2, size(b,2)/2+1:end ) );
%         c(size(c,1)/2+1:end, size(c,2)/2+1:end) = fenzhi( a(1:size(a,1)/2, 1:size(a,2)/2 ), b(1:size(b,1)/2, size(b,2)/2+1:end ) ) + fenzhi( a(size(a,1)/2+1:end, size(a,2)/2+1:end ), b(size(b,1)/2+1:end, size(b,2)/2+1:end ) );
    