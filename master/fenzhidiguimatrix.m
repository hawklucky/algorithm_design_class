
function  t = fenzhidiguimatrix()
    
    global A B 
    len = size(A,1);
    C = zeros(len);
    
    tic;
    %C = fenzhidigui(A,B);
    C = fenzhidiguiC(A,B,size(A,2));
    t = toc;
end


function c = fenzhidigui(a,b)
    
    c = zeros( size(a) );
    
    if size(a,1)==2 
        c(1,1) = a(1,1) * b(1,1) + a(1,2) * b(2,1);
        c(1,2) = a(1,1) * b(1,2) + a(1,2) * b(2,2);
        c(2,1) = a(2,1) * b(1,1) + a(2,2) * b(2,1);
        c(2,2) = a(2,1) * b(1,2) + a(2,2) * b(2,2);
    else
        m1 = fenzhidigui( a( 1:size(a,1)/2, 1:size(a,2)/2 ), b( 1:size(a,1)/2, size(a,2)/2+1:end ) - b( size(a,1)/2+1:end, size(a,2)/2+1:end ) );
        m2 = fenzhidigui( a( 1:size(a,1)/2, 1:size(a,2)/2 ) + a( 1:size(a,1)/2, size(a,2)/2+1:end ), b( size(a,1)/2+1:end, size(a,2)/2+1:end ) );
        m3 = fenzhidigui( a( size(a,1)/2+1:end, 1:size(a,2)/2 ) + a( size(a,1)/2+1:end, size(a,2)/2+1:end ), b( 1:size(a,1)/2, 1:size(a,2)/2 ) );
        m4 = fenzhidigui( a( size(a,1)/2+1:end, size(a,2)/2+1:end ), b( size(a,1)/2+1:end, 1:size(a,2)/2 ) - b( 1:size(a,1)/2, 1:size(a,2)/2 ) );
        m5 = fenzhidigui( a( 1:size(a,1)/2, 1:size(a,2)/2 ) + a( size(a,1)/2+1:end, size(a,2)/2+1:end ), b( 1:size(a,1)/2, 1:size(a,2)/2 ) + b( size(a,1)/2+1:end, size(a,2)/2+1:end ) );
        m6 = fenzhidigui( a( 1:size(a,1)/2, size(a,2)/2+1:end ) - a( size(a,1)/2+1:end, size(a,2)/2+1:end ), b( size(a,1)/2+1:end, 1:size(a,2)/2 ) + b( size(a,1)/2+1:end, size(a,2)/2+1:end ) );
        m7 = fenzhidigui( a( 1:size(a,1)/2, 1:size(a,2)/2 ) - a( size(a,1)/2+1:end, 1:size(a,2)/2 ), b( 1:size(a,1)/2, 1:size(a,2)/2 ) + b( 1:size(a,1)/2, size(a,2)/2+1:end ) );
        
        c(1:size(c,1)/2, 1:size(c,2)/2) = m5 + m4 - m2 + m6;
        c(1:size(c,1)/2, size(c,2)/2+1:end) = m1 + m2;
        c(size(c,1)/2+1:end, 1:size(c,2)/2) = m3 + m4;
        c(size(c,1)/2+1:end, size(c,2)/2+1:end) = m5 + m1 - m3 - m7;
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


%         m1 = fenzhidigui( extract(a,1,1), extract(b,1,2) - extract(b,2,2) );
%         m2 = fenzhidigui( extract(a,1,1) + extract(a,1,2), extract(b,2,2) );
%         m3 = fenzhidigui( extract(a,2,1) + extract(a,2,2), extract(b,1,1) );
%         m4 = fenzhidigui( extract(a,2,2), extract(b,2,1) - extract(b,1,1) );
%         m5 = fenzhidigui( extract(a,1,1) + extract(a,2,2), extract(b,1,1) + extract(b,2,2) );
%         m6 = fenzhidigui( extract(a,1,2) - extract(a,2,2), extract(b,2,1) + extract(b,2,2) );
%         m7 = fenzhidigui( extract(a,1,1) - extract(a,2,1), extract(b,1,1) + extract(b,1,2) );
