% % Sub-apartado 1
t= 0:0.01:20;

fprintf('Modelo Sub-amortiguado\n');

sim('modelo_subA',20)
[tp, sobr, te] = parametros_1(youtSub,t);
fprintf('Tiempo de pico = %4.2f\n',tp);
fprintf('Sobreoscilacion = %4.2f por ciento\n',sobr);
fprintf('Tiempo de establecimiento al 2 por ciento = %4.2f\n\n',te);

fprintf('Modelo Sobre-amortiguado\n');

sim('modelo_sobA',20)
[tp, sobr, te] = parametros_1(youtSob,t);
fprintf('Tiempo de pico = %4.2f\n',tp);
fprintf('Sobreoscilacion = %4.2f por ciento\n',sobr);
fprintf('Tiempo de establecimiento al 2 por ciento = %4.2f\n\n',te);

fprintf('Modelo criticamente amortiguado\n');

sim('modelo_criA',20)
[tp, sobr, te] = parametros_1(youtCri,t);
fprintf('Tiempo de pico = %4.2f\n',tp);
fprintf('Sobreoscilacion = %4.2f por ciento\n',sobr);
fprintf('Tiempo de establecimiento al 2 por ciento = %4.2f\n',te);
f1 = figure(1);
plot(t, [youtSob,youtSub,youtCri]);
legend('Modelo sobre-alimentado', 'Modelo sub-amortiguado', 'modelo criticamente amortiguado');
title ('Respuesta del sistema con los distintos modelos')
xlabel('Tiempo')
ylabel('y(t)')

% sub-apartado 2
f2=figure(2);
plot (t,youtSub,'DisplayName','Sin ceros')
hold on;
a=[1,0.5,0.2,0.1,0.05];
for i = 1:1:length(a)
    b=a(i);
    sim('modelo_Ceros',20)
    txt = ['Cero en ',num2str(b)];
    plot(t,yout2,'DisplayName',txt);
end
hold off
title ('Respuesta del sistema con distintos ceros')
xlabel('Tiempo')
ylabel('y(t)')
legend()
