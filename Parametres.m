clear;
clc;
t=3;
%----------Les parametres de la machine
Ls=0.1558;
Lr=1568;
Rs=1.2;
Rr=1.8;
Lm=0.15;%L'inductance mutuelle
Jm=0.07;%Inertie mécanique de la machine avec la partie tournante
f=0;%Coefficient de frottement
p=2;%Nombre de paires de poles
%-----------Modélisation de la machine
segma=1-(Lm^2)/(Ls*Lr);
Tr=Lr/Rr;
Ts=Ls/Rs;
gama=(1/(segma*Ls))*(Rs+(Lm^2)/(Tr*Lr));
Ks=(1/(segma*Ls))*(Lm/Lr);
alpha=(3/2)*p*(Lm/Lr)*(p/Jm);

B=[(1/(segma*Ls))  0              0 ;
    0              (1/(segma*Ls)) 0 ;
    0              0              0 ;
    0              0              0 ;
    0              0              0];

A1=[-gama 0 Ks/Tr 0 0;
    0 -gama 0 Ks/Tr 0;
    Lm/(Tr) 0 -1/Tr 0 0;
    0 Lm/(Tr) 0 -1/Tr 0;
    0 0 0 0 -f/Jm ];

A2=[0 0 0 Ks 0;
    0 0 -Ks 0 0;
    0 0 0 -1 0;
    0 0 1 0 0;
    0 0 0 0 0 ];

A3=[0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 alpha 0 0];

A4=[0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 -alpha 0];

E=[0;
   0;
   0;
   0;
   -p/Jm];
%---------------Les matrices de Park utilisées
CONCORDIA=sqrt(2/3)*[1 -0.5 -0.5 ;
                     0 (sqrt(3)/2) (-sqrt(3)/2) ;
                     1/2 1/2 1/2 ];
clark=(2/3)*[1 -0.5 -0.5 ;
             0 (sqrt(3)/2) (-sqrt(3)/2) ;
             1/2 1/2 1/2 ];
%--------Les conditions initiales de la machine
 X0=[0 0 0 0 0];
%----------Source d'alimentation
Vs_max=sqrt(2)*220;%DeadBeat regulator needs high voltage to work properly
Vsmax_ST=0;
fs=60;
%----------%Pas d'échantillonnage
Te=1e-4;
%---------------%La matrice de l'onduleur
T=[2 -1 -1;
    -1 2 -1;
    -1 -1 2]*(1/3);
%----------------Les valeurs nominales de la machine
Flux_n=0.946;
Couple_n=19.96;
courant_n=6.3;
Tension_n=230;
Puissance_n=3000;
Vitesse_n=150.27;%Wn=Pn/Cn
%---------------Les valeurs des références
Flux_ref=0.88;
Vitesse_ref_ST=1;%Step time
Vitesse_ref_int=100;%avant step time
Vitesse_ref=120;%apr?s step time
Cr=10;
Cr_ST=2;
%---------------Les valeurs des limitteurs
CL=2*Couple_n;
VL=Tension_n*sqrt(2);%Pour que la tension de référence ne dépasse pas Vs_max
%---------------Les bands d'hystérésis
Delta_Flux_s=0.02;
Delta_couple=0.01;
%----------------Les parametres des régulateurs
%------Regulateur IP de vitesse
Kt=1;
Wn=25;
Ki_vitesse=(Jm*Wn^2)/Kt;
Kp_vitesse=(2*Jm*Wn-f)/Kt;


