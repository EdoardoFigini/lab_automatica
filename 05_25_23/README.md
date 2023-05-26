# Sintesi del regolatore

## Scopo

sintetizzare, simulare e provare sperimentalmente diversi regolatori di temperatura per l'apparato termico sperimentale, confrontando i risultati ottenuti e commentando il tutto alla luce delle competenze apprese nel corso.

---

## Regolatore R1

`R1` del tipo PI:

<p align="center"><img src="https://latex.codecogs.com/svg.latex?R_1%28s%29%20%3D%20K%5Cleft%281%2B%20%5Cfrac%7B1%7D%7Bs%20T_i%7D%5Cright%29"></p>

Per ottenere un tempo di assestamento `Ta=120s` , occorre definire la pulsazione critica $\omega_c$: 

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Comega_%7Bc_%7BR1%7D%7D%20%3D%200.04%20%5Ctextnormal%7B%20rad/s%7D"></p>

Per la sintesi di `R1` (facendo riferimento a `M1`) si pone `Ti = T1`, in modo che lo zero del regolatore cancelli il polo del modello.

Si ottiene quindi la funzione di trasferimento ad anello

<p align="center"><img src="https://latex.codecogs.com/svg.latex?L%28s%29%20%3D%20%5Cfrac%7B%5Cmu%20K%7D%7BsT_1%7D%20"></p>

La cui pulsazione critica vale 

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Comega_c%20%3D%20%5Cfrac%7B%5Cmu%20K%20%7D%7BT_1%7D"></p>

da cui

<p align="center"><img src="https://latex.codecogs.com/svg.latex?K%20%3D%20%5Comega_c%20%5Ccdot%20%5Cfrac%7BT_1%7D%7B%5Cmu%7D"></p>

``` matlab
Ti = 130;
wc = 5/120;
K = wc * Ti/mu;
R1 = K * (1 + tf(1, [Ti 0]));
step(R1*M1 / (1 + R1*M1), 150);
```

![Image_1](./Images/Image_1.png)

Valutazione di pulsazione critica e margine di fase nei 4 modelli:

``` matlab
[gm,pm,wu,wc]=margin(R1*M1);
disp([wc,pm])
[gm,pm,wu,wc]=margin(R1*M2);
disp([wc,pm]) 
[gm,pm,wu,wc]=margin(R1*M3);
disp([wc,pm])
[gm,pm,wu,wc]=margin(R1*M4);
disp([wc,pm])
```

``` bash
0.0436   90.4735

0.0404   68.4966

0.0410   75.0917

0.0438   68.9616
```

Simulazione dei modelli in risposta a PV e CS

``` matlab
subplot(211);
F1 = R1*M1/(1+R1*M1); % funzione di sensitività complementare
F2 = R1*M2/(1+R1*M2);
F3 = R1*M3/(1+R1*M3);
step(F1, F2, F3, 150);
legend('M1','M2','M3');

subplot(212);
step(R1/(1+R1*M1),R1/(1+R1*M2),R1/(1+R1*M3),150);
legend('M1','M2','M3');
```

![Image_2](./Images/Image_2.png)

### Valutazione della risposta in frequenza 

``` matlab
bode(M1, M2, M3, M4);
legend('M1','M2','M3', 'M4');
```

![Image_3](./Images/Image_3.png)

si nota che i modelli sono equivalenti solo per pulsazioni fino a $0.005 \textnormal{ rad/s}$,
quindi per ottenere risposte uguali in tutti i modelli bisogna scegliere $\omega_c < 0.005 \textnormal{ rad/s}$

## Regolatore R2

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Comega_%7Bc_%7BR2%7D%7D%20%3D%200.005%20%5Ctextnormal%7B%20rad/s%7D"></p>

``` matlab
wc = 0.005;
K2 = wc * Ti/mu;
R2 = K2 * (1 + tf(1, [Ti 0]));
```

Il tempo di assestamento $Ta $ del regolatore sarà ora

<p align="center"><img src="https://latex.codecogs.com/svg.latex?T_a%20%3D%20%5Cfrac%7B5%7D%7B%5Comega_%7Bc_%7BR2%7D%7D%7D%20%3D%201000s"></p>

invece dei $120s$ desiderati.

Simulazione dei modelli in risposta a PV e CS

``` matlab
subplot(211);
step(R2*M1/(1+R2*M1),R2*M2/(1+R2*M2),R2*M3/(1+R2*M3),1000);
legend('M1','M2','M3');

subplot(212);
step(R1/(1+R2*M1),R2/(1+R2*M2),R2/(1+R2*M3),1000);
legend('M1','M2','M3');
```

![Image_4](./Images/Image_4.png)

Si possono anche usare modelli grossolani, ma si può fidarsene solo in bassa frequenza e bisogna ridurre quindi le prestazioni richieste.

Per ottenere prestazioni migliori servono modelli affidabili anche ad alte frequenze.

## Regolatore R2

Si richiede una banda di controllo che si estende a pulsazioni dove `M1` non è più affidabile.

ad esempio

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Comega_%7Bc_%7BR3%7D%7D%20%3D%200.5%20%5Ctextnormal%7B%20rad/s%7D"></p>

``` matlab
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
```

![Image_5](./Images/Image_5.png)

Si vede che le simulazioni con `M1` non descrivono in maniera adeguata il comportamento del sistema

## Regolatore R4

Regolatore PID (reale) usando un modello migliore (`M2`)

<p align="center"><img src="https://latex.codecogs.com/svg.latex?R_4%28s%29%20%3D%20%5Cfrac%7B%5Cmu_R%7D%7Bs%7D%20%5Cfrac%7B%281%2BsT_1%29%281%2BsT_2%29%7D%7B%281%20%2B%20s%5Ctau%29%7D"></p>

Si sintetizza `R4` im modo che la FDT ad anello abbia forma 

<p align="center"><img src="https://latex.codecogs.com/svg.latex?L%28s%29%20%3D%20%5Cfrac%7B0.1%7D%7Bs%281%20%2B%202s%29%7D"></p>

per ottenere

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Comega_%7Bc_%7BR3%7D%7D%20%3D%200.1%20%5C%2C%20%5Ctextnormal%7Brad/s%7D"></p>

`R4` è quindi

<p align="center"><img src="https://latex.codecogs.com/svg.latex?R_4%28s%29%20%3D%20%5Cfrac%7B1%7D%7BM_2%28s%29%7D%20%5Cfrac%7B0.1%7D%7Bs%281%2B2s%29%7D%20"></p>

``` matlab
R4=1/M2 * tf(1,conv([10 0],[2 1]));
clf;
margin(R4 * M2);
```

![Image_6](./Images/Image_6.png)

Si deve ora esprimere `R4` nella foma *ISA*

<p align="center"><img src="https://latex.codecogs.com/svg.latex?R_4%28s%29%20%3D%20%5Cfrac%7BK%7D%7BT_i%7D%0A%5Cfrac%7Bs%5E2%20T_i%20%5Cleft%28T_d%20%2B%20%5Cfrac%7BT_d%7D%7BN%7D%5Cright%29%20%2B%20s%5Cleft%28T_i%20%2B%20%5Cfrac%7BT_d%7D%7BN%7D%5Cright%29%20%2B%201%7D%7Bs%5Cleft%281%20%2B%20s%5Cfrac%7BT_d%7D%7BN%7D%5Cright%29%7D"></p>

I valori possono così essere ricavati:

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Cbegin%7Bdcases%7D%0A%5Cfrac%7BK%7D%7BT_i%7D%20%3D%20%5Cfrac%7B1%7D%7B1.383%7D%20%5C%5C%0AT_i%20%5Cleft%28T_d%20%2B%20%5Cfrac%7BT_d%7D%7BN%7D%5Cright%29%20%3D%201300%20%5C%5C%0AT_i%20%2B%20%5Cfrac%7BT_d%7D%7BN%7D%20%3D%20140%20%5C%5C%0A%5Cfrac%7BT_d%7D%7BN%7D%20%3D%202%0A%5Cend%7Bdcases%7D"></p>

da cui

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Cbegin%7Bdcases%7D%0AK%20%3D%2099.78%20%5C%5C%0AT_i%20%3D%20138%20%5C%5C%0AT_d%20%3D%207.42%20%5C%5C%0AN%20%3D%203.71%0A%5Cend%7Bdcases%7D"></p>

`R4` scritto in forma ISA è

<p align="center"><img src="https://latex.codecogs.com/svg.latex?R_4%28s%29%20%3D%2099.78%20%5Cleft%28%201%20%2B%20%5Cfrac%7B1%7D%7B138s%7D%20%5Cfrac%7B7.42s%7D%7B1%20%2B%202s%7D%20%5Cright%29"></p>

Si può vedere che le due forme coincidono dal diagramma di Bode:

``` matlab
bode(R4,99.78*(1+tf(1,[138 0])+tf([7.42 0],[7.42/3.71 1])));
```

![Image_7](./Images/Image_7.png)

---

I quattro regolatori trovati hanno i seguenti valori:

![Image_8](./Images/Image_8.png)

# Prove dei regolatori

**Segnali da applicare: **

- scalini di SP di `±3°C`

- scalini di LD (Q2) di `±20%`

**Caratteristiche da valutare: **

- tempo di assestamento e sovraelongazione della risposta a SP

- tempo di assestamento e massima deviazione della risposta a LD

- saturazione di CS quando la banda passante è troppo alta (`R3`) 

![Image_9](./Images/Image_9.png)

- `SP_Tp` è $y^*$

- `Q2` è il disturbo dato dall’altro transistor

- `Te` è la condizione iniziale del sistema (Temperatura dell’ambiente)

- $n$ (disturbo di misura) è simulato con il blocco `T probe` 

**Regolatore PI:**

![Image_10](./Images/Image_10.png)

`Tt` è il parametro che gestisce l’*anti wind-up*

### Parametri Regolatore (R1)

![Image_11](./Images/Image_11.png)

`Tt` posto alto per simulare l’assenza di anti wind-up

### Simulazione



**grafico uscita:**

![Image_12](./Images/Image_12.png)

- no sovraelongazioni

- tempo di assestamento ci sta

- a $t = 800s$ risposta al disturbo `Q2`

**grafico variabile di controllo:**

![Image_13](./Images/Image_13.png)

→ satura



**grafico uscita:**

![Image_14](./Images/Image_14.png)

→ molto più lento

**grafico variabile di controllo:**

![Image_15](./Images/Image_15.png)

→ variabile di controllo molto meno sollecitata

### Parametri Regolatore (R3)

![Image_16](./Images/Image_16.png)

### Simulazione

**andamento variabile di controllo:**

![Image_17](./Images/Image_17.png)

`R3` molto aggressivo: satura immediatamente e l’anti wind-up per rimediare inverte l’andamento 

### Parametri Regolatore (R4)

