function [sobr,ep,ev] = parametros_2(sa_r,sa_s,t)
    l = length(sa_r);
    [M,I] = max(sa_s);
    sobr = (M-1)*100;
    ep = 1 - sa_s(l);
    ev = t(l)-sa_r(l);
end

