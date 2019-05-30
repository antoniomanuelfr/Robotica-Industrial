% Funcion para calcular los parametros de un sistema
function [ tp, sobr, te ] = parametros_1(yout, t)
    [M,I] = max(yout);
    tp = t(I);
    % Restamos uno porque sabemos que la entrada es un escalon unitario
    sobr = (M-1)*100;
    err = 0.02;
    min_value = 1-err;
    max_value = 1+err;
    for a = length(yout):-1:1
       if yout(a) < min_value || yout(a) > max_value
            te = t(a-1);
            break;
       end
    end 
end
