sim ('seg_orden_re',20);

f1 = figure(1);
plot (tout_s, [re_r,tout_s]);
legend('Señal segundo orden realimentado','x(t)');
title('Error velocidad modelo segundo orden realimentado');
xlabel('Tiempo');

sim ('controlador_PI',20);
f2 = figure(2);
plot (tout_c, [cont_r,tout_c]);
legend('Señal del controlador ','x(t)');
title('Error velocidad controlador PI');
xlabel('Tiempo');

