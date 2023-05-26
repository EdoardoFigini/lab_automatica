clear all
close all
clc

%% Sintesi del regolatore

% Definisco modelli trovati nella scorsa sessione di laboratorio
mu = 4.15/30;
M1 = tf(mu, [620/5 1]);
M2 = tf(mu, conv([620/5 1], [10 1]));
M3 = tf(mu * [5 1], conv(conv([620/5 1], [10 1]), [2 1]));
M4 = tf(mu * [4 1],conv(conv([110 1],[12 1]),[2 1]));

%% R1
Ti = 130;
wc = 5/120;
K = wc * Ti/mu;
R1 = K * (1 + tf(1, [Ti 0]));
step(R1*M1 / (1 + R1*M1), 150);

% valutazione di pulsazione critica e margine di fase nei 4 modelli
[gm,pm,wu,wc]=margin(R1*M1);
disp([wc,pm])
[gm,pm,wu,wc]=margin(R1*M2);
disp([wc,pm]) 
[gm,pm,wu,wc]=margin(R1*M3);
disp([wc,pm])
[gm,pm,wu,wc]=margin(R1*M4);
disp([wc,pm])

% simulazione dei modelli in risposta a PV e CS
subplot(211);
F1 = R1*M1/(1+R1*M1);
F2 = R1*M2/(1+R1*M2);
F3 = R1*M3/(1+R1*M3);
step(F1, F2, F3, 150);
legend('M1','M2','M3');

subplot(212);
step(R1/(1+R1*M1),R1/(1+R1*M2),R1/(1+R1*M3),150);
legend('M1','M2','M3');

% Valutazione della risposta in frequenza
clf;
bode(M1, M2, M3, M4);
legend('M1','M2','M3', 'M4');

%% R2
wc = 0.005;
K2 = wc * Ti/mu;
R2 = K2 * (1 + tf(1, [Ti 0]));

clf;
subplot(211);
step(R2*M1/(1+R2*M1),R2*M2/(1+R2*M2),R2*M3/(1+R2*M3),1000);
legend('M1','M2','M3');

subplot(212);
step(R2/(1+R2*M1),R2/(1+R2*M2),R2/(1+R2*M3),1000);
legend('M1','M2','M3');

%% R3
wc = 0.5;
K3 = wc * Ti/mu;
R3 = K3 * (1 + tf(1, [Ti 0]));

clf;
subplot(211);
step(R3*M1/(1+R3*M1),R3*M2/(1+R3*M2),R3*M3/(1+R3*M3),50);
legend('M1','M2','M3');

subplot(212);
step(R3/(1+R3*M1),R3/(1+R3*M2),R3/(1+R3*M3),50);
legend('M1','M2','M3');

%% R4
R4=1/M2*tf(1,conv([10 0],[2 1]));
clf;
margin(R4 * M2);

bode(R4, 99.78*(1+tf(1,[138 0])+tf([7.42 0],[7.42/3.71 1])));
