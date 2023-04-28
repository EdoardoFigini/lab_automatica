# Parte 1: Scalino

## Obiettivo

modello per controllare la temperatura della piastrina ($T_p$) agendo sul comando al transistor 1 ($Q_1$) e considerando il comando al transiostor 2 come un disturbo ($Q_2)$.

## Modelica

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/60da06f2-abc9-40fa-911c-5233d739d030/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=c06e9c4b94693399206e9131cfb4daed5e39e866d913733ca0365bdde4044be8&X-Amz-SignedHeaders=host&x-id=GetObject">

**Verifica della stabilità del sistema in risposta allo scalino**

### Setup dello scalino:

- Ampiezza: `30%`

- Istante di tempo: `2000`

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7852de4c-ad88-4605-94f3-46fb5bab9540/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=580d49a2707d15f63c67b14b2d041c92540d88222ea2f525054938d3079ba4bc&X-Amz-SignedHeaders=host&x-id=GetObject">

### Simulazione: 

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/580fe160-2a1f-4bfd-9b9d-ed267ec8e0ba/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=235d8598f8df1ab2456a78998688031f058680b9373d9c3e9085140babb57864&X-Amz-SignedHeaders=host&x-id=GetObject">

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/35acefb8-b5ff-4336-87ca-d73c1475f9f5/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=decee8b548a084753d95cd7f35dd438df99f99d014b05f35a4bd29bd9e6b6f22&X-Amz-SignedHeaders=host&x-id=GetObject">

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/53005e67-b25c-40ab-8684-aab8ea3f22f2/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=5121c4a52dcb34d3b0c3a70e8c9716a4454784f8b7c50f2ac206fb8ef99585a1&X-Amz-SignedHeaders=host&x-id=GetObject">

**Parametri mostrati nel grafico:**

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/52055dad-c93a-4385-b022-3ae66c5adfa4/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=a3d4d9fc504f5e45de8f14459e3137f1e47820d794723469914c9a6eb198ce06&X-Amz-SignedHeaders=host&x-id=GetObject">

**File output:**

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/ffb03ff1-8ebd-4700-981f-d77f03a966e1/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=30b250555df12d35795a1789f661add6ce4e3bff1a2cce6cbb0c5150d9340c55&X-Amz-SignedHeaders=host&x-id=GetObject">

## Matlab

### Obiettivo

Trovare la funzione di trasferimento che meglio descrive il sistema simulato



<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Clim_%7Bs%5Cto%200%7D%20%5Cfrac%7B30%7D%7Bs%7D%20%5Ccdot%20s%20%5Ccdot%20%5Cfrac%7B%5Cmu%7D%7Bs%20T_1%20%2B%201%7D%20%3D%204.15"></p>

$4,15$ valore da trovare sul grafico

Si può ricavare:

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Cmu%20%3D%20%5Cfrac%7B4.15%7D%7B30%7D"></p>

- **Primo ordine**

<p align="center"><img src="https://latex.codecogs.com/svg.latex?M_1%20%3D%20%5Cfrac%7B%5Cmu%7D%7Bs%20T_1%20%2B%201%7D"></p>

<p align="center"><img src="https://latex.codecogs.com/svg.latex?T_1%20%3D%20%5Cfrac%7BT_A%7D%7B5%7D"></p>

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/3b18618b-1c0c-455a-85f9-42c35d596998/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172917Z&X-Amz-Expires=3600&X-Amz-Signature=d3f2f1031fbb21d7f32cbbf6bdbe5fca39ec9db573d0882c0e15a56854975a4f&X-Amz-SignedHeaders=host&x-id=GetObject">

``` matlab
mu = 4.15/30;
T1 = 620/5;

M1 = tf(mu, [T1 1]);

plot(t, Tp, 'b', t, 30*step(M1, t), 'r');
grid;
```

- **Secondo ordine**

<p align="center"><img src="https://latex.codecogs.com/svg.latex?M_2%20%3D%20%5Cfrac%7B%5Cmu%7D%7B%28s%20T_1%20%2B%201%29%28s%20T_2%20%2B%201%29%7D"></p>

$T_2$ con valore arbitrario ($T_2 \ll T_1$)

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/67bfa9d7-8eae-41aa-8600-bc5bfc96e418/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172918Z&X-Amz-Expires=3600&X-Amz-Signature=48410d3757e8190c68a1630d889f731fbbaee0ca04371d4f001f661099c3da17&X-Amz-SignedHeaders=host&x-id=GetObject">

``` matlab
T2 = 10;

M2 = tf(mu, conv([T1 1], [T2 1]));

plot(t, Tp, 'b', t, 30*step(M2, t), 'r');
grid;
```

- **Terzo ordine e uno zero**

<p align="center"><img src="https://latex.codecogs.com/svg.latex?M_3%20%3D%20%5Cfrac%7B%5Cmu%28s%20T_z%20%2B%201%29%7D%7B%28s%20T_1%20%2B%201%29%28s%20T_2%20%2B%201%29%28s%20T_3%20%2B%201%29%7D"></p>

$T_3$ con valore arbitrario ($T_3 \ll T_2$)

$T_z$ con valore arbitrario ($|T_3| < |T_z| < |T_2|$)

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/dc4b1bfe-a7eb-44e4-8830-0e21ba30febb/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172919Z&X-Amz-Expires=3600&X-Amz-Signature=5d73b2aae550ab31a5c37b3800660e77d14c1bbffca90e4f929c736927af6056&X-Amz-SignedHeaders=host&x-id=GetObject">

``` matlab
Tz = 5;
T3 = 2;

M3 = tf(mu * [Tz 1], conv(conv([T1 1], [T2 1]), [T3 1]));

plot(t, Tp, 'b', t, 30*step(M2, t), 'r');
grid;
```

---

# Parte 2: Sinusoide

## Modelica

### Setup Sinusoide

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/ab2e2523-799c-438e-9ea8-b58f03a618dd/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=744a28787eb31736a492a64dc3f7f83d7f1bbd17a61f26612f994681ad34a84e&X-Amz-SignedHeaders=host&x-id=GetObject">

### Simulazione

(Stop time 12000 → sinusoide non interferisce con scalino)

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1309567a-9daf-47c7-a65c-86689506e03d/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=d29d6bbdda22402d701469d061a74d859038a25165e94bb1e3c379b430aef35e&X-Amz-SignedHeaders=host&x-id=GetObject">

**Parametri mostrati nel grafico:**

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/eb4ae55a-be73-4752-97b5-3016ead3841d/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=0d81d05c17e36c14845c9e67d32a5f52914ede192087ef2d78450bdda78b0501&X-Amz-SignedHeaders=host&x-id=GetObject">

## Matlab

``` matlab
clear all
close all
clc

data = csvread('sen.csv', 1);

start = find(data(:,1) == 8000);
stop = find(data(:,1) == 10000);
t = data(start:stop, 1);
Q1 = data(start:stop, 2);
Tp = data(start:stop, 6);

t = t - t(1)
Tp = Tp - mean(Tp);
Q1 = Q1 - 30;

plot(t, Q1, 'b', t, 10*Tp, 'r');
grid;
```

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7b8ee494-43ca-4f8a-a049-b683b8e45e39/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172915Z&X-Amz-Expires=3600&X-Amz-Signature=105071b31ec46977e27bfe859b1bbb0e6a76483f0647df1d1406b0bb6969f595&X-Amz-SignedHeaders=host&x-id=GetObject">

- Calcolare punti della risposta dal grafico

- frequenza della risposta

$T$ periodo del segnale sinusoidale

<p align="center"><img src="https://latex.codecogs.com/svg.latex?w%20%3D%20%5Cfrac%7B2%5Cpi%7D%7BT%7D"></p>

- modulo della risposta

<p align="center"><img src="https://latex.codecogs.com/svg.latex?%5Cmu%20%3D%20%5Cfrac%7B%5Cfrac%7B%5Ctextnormal%7Bpeak%7D%7D%7B10%7D%7D%7B20%7D"></p>

dove $\textnormal{peak}$ è il picco della risposta misurato dal grafico (riscalato di $10$ per visibilità sul grafico)

- fase della risposta

<p align="center"><img src="https://latex.codecogs.com/svg.latex?p%20%3D%20%5Cfrac%7B%5CDelta%20t%7D%7BT%7D%5Ccdot%20360"></p>

Dove $\Delta t$ è il tempo che trascorre tra un picco della sinusoide e uno della riposta (per $240$ è $(1020-1070)$)

Codice:

``` matlab
%% Risposta alla prima frequenza (T=240s)
w1 = 2*pi/240;
m1 = 8.2/20/10;
p1 = (1020-1073)/240 * 360;

%% Risposta alla seconda frequenza (T=120s)
w2 = 2*pi/120;
m2 = 3.7/20/10;
p2 = (1710-1746)/120 * 360;

%% Risposta alla terza frequenza (T=60s)
w3 = 2*pi/60;
m3 = 1.2/20/10;
p3 = (2055-2076)/60 * 360;
```

- Calcolare la risposta in frequenza dei modelli calcolati in precedenza (risposta allo scalino)

Codice:

``` matlab
mu = 4.15/30;
T1 = 620/5;
M1 = tf(mu, [T1 1]);

T2 = 10;
M2 = tf(mu, conv([T1 1], [T2 1]));

Tz = 5;
T3 = 2;
M3 = tf(mu * [Tz 1], conv(conv([T1 1], [T2 1]), [T3 1]));


w = logspace(-3, 0);
[mM1, pM1] = bode(M1, w);
[mM2, pM2] = bode(M2, w);
[mM3, pM3] = bode(M3, w);

mM1_dB = 20*log10(mM1(:));
pM1 = pM1(:);

mM2_dB = 20*log10(mM2(:));
pM2 = pM2(:);

mM3_dB = 20*log10(mM3(:));
pM3 = pM3(:);
```

- Plottare i diagrammi di bode delle risposte appena calcolate e vedere quale dei tre si avvicina meglio ai punti misurati

Codice:

``` matlab
wp = [w1, w2, w3];
mp_db = 20*log10([m1, m2, m3]);
pp = [p1 p2 p3];

subplot(211);
semilogx(w, mM1_dB, 'b', w, mM2_dB, 'g', w, mM3_dB, 'r', wp, mp_dB, 'ok');
legend('primo ordine', 'secondo ordine', 'terzo ordine con zero');

subplot(212);
semilogx(w, pM1, 'b', w, pM2, 'g', w, pM3, 'r', wp, pp, 'ok');
legend('primo ordine', 'secondo ordine', 'terzo ordine con zero');
```

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e5cff7ce-f86f-4f41-b417-c52c1aedc794/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172926Z&X-Amz-Expires=3600&X-Amz-Signature=dded52196148e76d784d3ada05285168426eebaee8a7c0a9313e7bb093043f3e&X-Amz-SignedHeaders=host&x-id=GetObject">

Si nota che l’approssimazione più corretta è quella rossa, ma è ancora migliorabile:

``` matlab
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
```

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/73f64814-199f-460f-b2ea-fd6134da11a1/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230428T172926Z&X-Amz-Expires=3600&X-Amz-Signature=b9f48053890c173c545c72a656648173d910c5fe2dd61270ebbc90e98db91959&X-Amz-SignedHeaders=host&x-id=GetObject">

Purtroppo però il modello ottimizzato per risposta in frequenza (`M4`) approssima male la risposta allo scalino.

**Il modello perfetto non c'è perché nessuna delle necessarie ipotesi semplificative è a rigore vera**

**Quale scelgo?**

Dipende:

- Un modello identificato nel solo dominio del tempo mira a riprodurre bene i dati da cui è tratto e non è in generale particolarmente preciso in nessuna banda.

- Un modello identificato badando anche al dominio della frequenza può essere reso preciso nella banda desiderata, a patto di avere dati in quella banda: questo può essere molto utile per la sintesi del controllo.

