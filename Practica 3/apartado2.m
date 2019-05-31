
fprintf('Sistema de segundo orden con realimentación\n')
sim ('seg_orden_re',20);
[sobr,ep,ev] = parametros_2(re_r,re_s,tout_s);
fprintf('Sobreoscilacion = %4.2f por ciento\n',sobr);
fprintf('Error de posicion = %4.2f\n',ep);
fprintf('Error de velocidad = %4.2f\n\n',ev);

f1 = figure(1);
plot (tout_s, [re_r,tout_s]);
legend('Señal segundo orden realimentado','x(t)');
title('Error velocidad modelo segundo orden realimentado');
xlabel('Tiempo');

f2 = figure(2);
plot (tout_s, re_s);
legend('Señal escalon');
title('Respuesta del sistema realimentado cuando entrada escalon');
xlabel('Tiempo');

fprintf('Controlador PI\n')

sim ('controlador_PI',20);
[sobr,ep,ev] = parametros_2(cont_r,cont_s,tout_c);
fprintf('Sobreoscilacion = %4.2f por ciento\n',sobr);
fprintf('Error de posicion = %4.2f\n',ep);
fprintf('Error de velocidad = %4.2f\n\n',ev);

f3 = figure(3);
plot (tout_c, [cont_r,tout_c]);
legend('Señal del controlador ','x(t)');
title('Error velocidad controlador PI');
xlabel('Tiempo');

f4 = figure(4);
plot (tout_s, cont_s);
legend('Señal escalon');
title('Respuesta del controlador PI cuando entrada escalon');
xlabel('Tiempo');

f5 = figure(5);
plot (tout_c, [cont_s,re_s]);
legend('Controlador PI','Realimentado');
title('Controlador PI vs Realimentado (Escalon)');
xlabel('Tiempo');
f6 = figure(6);
plot (tout_c, [cont_r,re_r,tout_c]);
legend('Controlador PI','Realimentado', 'x(t)');
title('Controlador PI vs Realimentado (Rampa unitaria)');
xlabel('Tiempo');

