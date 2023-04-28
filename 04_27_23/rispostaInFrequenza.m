clear all
close all
clc

% leggere il file csv 
data = csvread('./data/freq.csv', 1);

% nella simulazione abbiamo fatto partire la sinusoide a 8000
start = find(data(:,1) == 8000);
stop = find(data(:,1) == 10000);
t = data(start:stop, 1);
Q1 = data(start:stop, 2);
Tp = data(start:stop, 6);

% tempo parte a 0
t = t - t(1);
% centrare verticalmente Tp
Tp = Tp - mean(Tp);
% rimuovere offset dato dallo scalino (30)
Q1 = Q1 - 30;

% Tp moltiplicata per 10 per visibilità sul grafico
plot(t, Q1, 'b', t, 10*Tp, 'r');
grid;


%% Risposta alla prima frequenza (T=240s)
w1 = 2*pi/240;
% 8.2 picco della risposta
m1 = 8.2/20/10;
% differenza tra un picco della sinusoide e il relativo picco della
% risposta
p1 = (1020-1073)/240 * 360;

%% Risposta alla seconda frequenza (T=120s)
w2 = 2*pi/120;
m2 = 3.6/20/10;
p2 = (1710-1746)/120 * 360;

%% Risposta alla terza frequenza (T=60s)
w3 = 2*pi/60;
m3 = 1.2/20/10;
p3 = (2055-2076)/60 * 360;

%% Funzioni di trasferimento

mu = 4.15/30;
T1 = 620/5;
M1 = tf(mu, [T1 1]);

T2 = 10;
M2 = tf(mu, conv([T1 1], [T2 1]));

Tz = 5;
T3 = 2;
M3 = tf(mu * [Tz 1], conv(conv([T1 1], [T2 1]), [T3 1]));


w = logspace(-3, 0);
% mM1 -> modulo
% pM1 -> fase
[mM1, pM1] = bode(M1, w);
[mM2, pM2] = bode(M2, w);
[mM3, pM3] = bode(M3, w);

mM1_dB = 20*log10(mM1(:));
pM1 = pM1(:);

mM2_dB = 20*log10(mM2(:));
pM2 = pM2(:);

mM3_dB = 20*log10(mM3(:));
pM3 = pM3(:);

% freq, moduli e fase dei punti misurati
wp = [w1, w2, w3];
mp_dB = 20*log10([m1, m2, m3]);
pp = [p1 p2 p3];

subplot(211);
% plottato i moduli delle funz di trasf in db
% wp, mp_db, 'ok' -> punti calcolati
semilogx(w, mM1_dB, 'b', w, mM2_dB, 'g', w, mM3_dB, 'r', wp, mp_dB, 'ok');
legend('primo ordine', 'secondo ordine', 'terzo ordine con zero');

subplot(212);
semilogx(w, pM1, 'b', w, pM2, 'g', w, pM3, 'r', wp, pp, 'ok');
legend('primo ordine', 'secondo ordine', 'terzo ordine con zero');


%%  Modello migliore rispetto al dominio delle frequenze
M4 = tf(mu * [4 1],conv(conv([110 1],[12 1]),[2 1]));
[mM4,pM4] = bode(M4,w);
mM4_dB = 20*log10(mM4(:));
pM4 = pM4(:);

subplot(211);
semilogx(w, mM3_dB, 'r', w, mM4_dB, 'b', wp, mp_dB, 'ok');
subplot(212);
semilogx(w, pM3, 'r', w, pM4, 'b', wp, pp, 'ok');
legend('M3','M4');
