clear all
close all
clc

Fs = 2000;
Obits = 16;
ini = 170; % [s]
fin = 172; % [s]

figure;
load ecgdata.mat
% ecgdata = edfread('r04.edf');
x = ecgdata;
x = x(Fs*ini:(Fs*fin)-1);


% t = (0:length(x)-1)/Fs;
t = ini:1/Fs:fin-1/Fs;
plot(t, x);

% Trasladar
x_t = x + abs(min(x));

% Normalizar
x_n = x_t / max(x_t);

% Amplificar
x_a = x_n * 2^Obits-1;


figure;
subplot(4,1,1)
plot(t,x)
grid on
xlabel('Tiempo');
ylabel('Amplitud');
title('Original')

subplot(4,1,2)
plot(t,x_t)
grid on
xlabel('Tiempo');
ylabel('Amplitud');
title('Trasladada')

subplot(4,1,3)
plot(t,x_n)
grid on
xlabel('Tiempo');
ylabel('Amplitud');
title('Normalizada')

subplot(4,1,4)
plot(t,x_a)
grid on
xlabel('Tiempo');
ylabel('Amplitud');
title('Amplificada')

figure;
for n = 1: 1 :Obits
    subplot(4,4,n);
    x_c = cuantificador_3(x_a,n,Obits);
    plot(t,x_c)
    title(strcat(num2str(n),'-bit'))
    xlabel('Tiempo');
    ylabel('Amplitud');
    xlim([ini fin]);
end

