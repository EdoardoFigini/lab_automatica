clear all
close all
clc

% leggere il file csv 
data = csvread('./data/sca.csv', 1);

% sintassi array(:, x) tutte le righe solo della x-esima colonna

% t tempo
t = data(:, 1);
% Q1 potenza del primo transistor (scalino)
Q1 = data(:, 2);
% Tp temperatura della piastrina
Tp = data(:, 6);

% dex indice dell'inizio dello scalino
% diff Q1 fa la differenza tra gli elementi di Q1
% find trova il primo elemento != 0
dex = find(diff(Q1));
t = t(dex:end)-t(dex);
Tp = Tp(dex:end)-Tp(dex);
Q1 = Q1(dex:end)-Q1(dex);

plot(t, Tp);
grid;

% rimozione del disturbo dato dalla temperatura dell'aria
Tp = Tp - t * (1.025/1000);

plot(t, Tp);
grid;

%% Trovare la funzione di trasferimento

% guadagno
mu = 4.15/30;
% costatnte di tempo del polo dominante
T1 = 620/5;

%% 1 polo

% tf -> transfer function
% tf con numeratore mu e divisore (s*T1 + 1)
M1 = tf(mu, [T1 1]);

plot(t, Tp, 'b', t, 30*step(M1, t), 'r');
grid;

%% 2 poli
% T2 << T1, 15 arbitrario
T2 = 10;

% conv([],[]) -> moltiplicazione polinomiale tra (s*T1 + 1)(s*T2 + 1)
M2 = tf(mu, conv([T1 1], [T2 1]));

plot(t, Tp, 'b', t, 30*step(M2, t), 'r');
grid;

%% 3 poli e 1 zero
% zero negativo e lento
Tz = 5;
% T3 << T2, 2 arbitrario
T3 = 2;

M3 = tf(mu * [Tz 1], conv(conv([T1 1], [T2 1]), [T3 1]));

plot(t, Tp, 'b', t, 30*step(M2, t), 'r');
grid;