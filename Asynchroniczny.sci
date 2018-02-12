
clc;
clear;
lines(0);

function E = energia(W, V)
    suma = 0
    w = size(W, "r");
    k = size(W, "c");
    for i = 1: w
        for j = 1: k
            suma = suma + W(i, j)*V(i)*V(j);
        end
    end
    E = -1/2 * suma;
endfunction

function [M] = unipolarna(W, P)
RozmiarKolumn = size(W, 'c');

if RozmiarKolumn == 3 then   
//dla macierzy WAsynchUni
X=[ 0 0 0;
    0 0 1;
    0 1 0;
    0 1 1;
    1 0 0;
    1 0 1;
    1 1 0;
    1 1 1];
end
if RozmiarKolumn == 4 then     
X=[ 0 0 0 0;
    0 0 0 1;
    0 0 1 0;
    0 0 1 1;
    0 1 0 0;
    0 1 0 1;
    0 1 1 0;
    0 1 1 1;
    1 0 0 0;
    1 0 0 1;
    1 0 1 0;
    1 0 1 1;
    1 1 0 0;
    1 1 0 1;
    1 1 1 0;
    1 1 1 1];    
end
if RozmiarKolumn == 6 then
//dla macierzy Vjeden Vcztery i VL
X=[0 0 0 0 0 0;
   0 0 0 0 0 1;
   0 0 0 0 1 0;
   0 0 0 0 1 1;
   0 0 0 1 0 0;
   0 0 0 1 0 1;
   0 0 0 1 1 0;
   0 0 0 1 1 1;
   0 0 1 0 0 0;
   0 0 1 0 0 1;
   0 0 1 0 1 0;
   0 0 1 0 1 1;
   0 0 1 1 0 0;
   0 0 1 1 0 1;
   0 0 1 1 1 0;
   0 0 1 1 1 1;
   0 1 0 0 0 0;
   0 1 0 0 0 1;
   0 1 0 0 1 0;
   0 1 0 0 1 1;
   0 1 0 1 0 0;
   0 1 0 1 0 1;
   0 1 0 1 1 0;
   0 1 0 1 1 1;
   0 1 1 0 0 0;
   0 1 1 0 0 1;
   0 1 1 0 1 0;
   0 1 1 0 1 1;
   0 1 1 1 0 0;
   0 1 1 1 0 1;
   0 1 1 1 1 0;
   0 1 1 1 1 1;
   1 0 0 0 0 0;
   1 0 0 0 0 1;
   1 0 0 0 1 0;
   1 0 0 0 1 1;
   1 0 0 1 0 0;
   1 0 0 1 0 1;
   1 0 0 1 1 0;
   1 0 0 1 1 1;
   1 0 1 0 0 0;
   1 0 1 0 0 1;
   1 0 1 0 1 0;
   1 0 1 0 1 1;
   1 0 1 1 0 0;
   1 0 1 1 0 1;
   1 0 1 1 1 0;
   1 0 1 1 1 1;
   1 1 0 0 0 0;
   1 1 0 0 0 1;
   1 1 0 0 1 0;
   1 1 0 0 1 1;
   1 1 0 1 0 0;
   1 1 0 1 0 1;
   1 1 0 1 1 0;
   1 1 0 1 1 1;
   1 1 1 0 0 0;
   1 1 1 0 0 1;
   1 1 1 0 1 0;
   1 1 1 0 1 1;
   1 1 1 1 0 0;
   1 1 1 1 0 1;
   1 1 1 1 1 0;
   1 1 1 1 1 1];
end
if RozmiarKolumn == 9 then
//dla Cj
X=[0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 1;
   0 0 0 0 0 0 0 1 0;
   0 0 0 0 0 0 0 1 1;
   0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 1 0 1;
   0 0 0 0 0 0 1 1 0;
   0 0 0 0 0 0 1 1 1;
   0 0 0 0 0 1 0 0 0;
   0 0 0 0 0 1 0 0 1;
   0 0 0 0 0 1 0 1 0;
   0 0 0 0 0 1 0 1 1;
   0 0 0 0 0 1 1 0 0;
   0 0 0 0 0 1 1 0 1;
   0 0 0 0 0 1 1 1 0;
   0 0 0 0 0 1 1 1 1;
   0 0 0 0 1 0 0 0 0;
   0 0 0 0 1 0 0 0 1;
   0 0 0 0 1 0 0 1 0;
   0 0 0 0 1 0 0 1 1;
   0 0 0 0 1 0 1 0 0;
   0 0 0 0 1 0 1 0 1;
   0 0 0 0 1 0 1 1 0;
   0 0 0 0 1 0 1 1 1;
   0 0 0 0 1 1 0 0 0;
   0 0 0 0 1 1 0 0 1;
   0 0 0 0 1 1 0 1 0;
   0 0 0 0 1 1 0 1 1;
   0 0 0 0 1 1 1 0 0;
   0 0 0 0 1 1 1 0 1;
   0 0 0 0 1 1 1 1 0;
   0 0 0 0 1 1 1 1 1;
   0 0 0 1 0 0 0 0 0;
   0 0 0 1 0 0 0 0 1;
   0 0 0 1 0 0 0 1 0;
   0 0 0 1 0 0 0 1 1;
   0 0 0 1 0 0 1 0 0;
   0 0 0 1 0 0 1 0 1;
   0 0 0 1 0 0 1 1 0;
   0 0 0 1 0 0 1 1 1;
   0 0 0 1 0 1 0 0 0;
   0 0 0 1 0 1 0 0 1;
   0 0 0 1 0 1 0 1 0;
   0 0 0 1 0 1 0 1 1;
   0 0 0 1 0 1 1 0 0;
   0 0 0 1 0 1 1 0 1;
   0 0 0 1 0 1 1 1 0;
   0 0 0 1 0 1 1 1 1;
   0 0 0 1 1 0 0 0 0;
   0 0 0 1 1 0 0 0 1;
   0 0 0 1 1 0 0 1 0;
   0 0 0 1 1 0 0 1 1;
   0 0 0 1 1 0 1 0 0;
   0 0 0 1 1 0 1 0 1;
   0 0 0 1 1 0 1 1 0;
   0 0 0 1 1 0 1 1 1;
   0 0 0 1 1 1 0 0 0;
   0 0 0 1 1 1 0 0 1;
   0 0 0 1 1 1 0 1 0;
   0 0 0 1 1 1 0 1 1;
   0 0 0 1 1 1 1 0 0;
   0 0 0 1 1 1 1 0 1;
   0 0 0 1 1 1 1 1 0;
   0 0 0 1 1 1 1 1 1;
   0 0 1 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0 1;
   0 0 1 0 0 0 0 1 0;
   0 0 1 0 0 0 0 1 1;
   0 0 1 0 0 0 1 0 0;
   0 0 1 0 0 0 1 0 1;
   0 0 1 0 0 0 1 1 0;
   0 0 1 0 0 0 1 1 1;
   0 0 1 0 0 1 0 0 0;
   0 0 1 0 0 1 0 0 1;
   0 0 1 0 0 1 0 1 0;
   0 0 1 0 0 1 0 1 1;
   0 0 1 0 0 1 1 0 0;
   0 0 1 0 0 1 1 0 1;
   0 0 1 0 0 1 1 1 0;
   0 0 1 0 0 1 1 1 1;
   0 0 1 0 1 0 0 0 0;
   0 0 1 0 1 0 0 0 1;
   0 0 1 0 1 0 0 1 0;
   0 0 1 0 1 0 0 1 1;
   0 0 1 0 1 0 1 0 0;
   0 0 1 0 1 0 1 0 1;
   0 0 1 0 1 0 1 1 0;
   0 0 1 0 1 0 1 1 1;
   0 0 1 0 1 1 0 0 0;
   0 0 1 0 1 1 0 0 1;
   0 0 1 0 1 1 0 1 0;
   0 0 1 0 1 1 0 1 1;
   0 0 1 0 1 1 1 0 0;
   0 0 1 0 1 1 1 0 1;
   0 0 1 0 1 1 1 1 0;
   0 0 1 0 1 1 1 1 1;
   0 0 1 1 0 0 0 0 0;
   0 0 1 1 0 0 0 0 1;
   0 0 1 1 0 0 0 1 0;
   0 0 1 1 0 0 0 1 1;
   0 0 1 1 0 0 1 0 0;
   0 0 1 1 0 0 1 0 1;
   0 0 1 1 0 0 1 1 0;
   0 0 1 1 0 0 1 1 1;
   0 0 1 1 0 1 0 0 0;
   0 0 1 1 0 1 0 0 1;
   0 0 1 1 0 1 0 1 0;
   0 0 1 1 0 1 0 1 1;
   0 0 1 1 0 1 1 0 0;
   0 0 1 1 0 1 1 0 1;
   0 0 1 1 0 1 1 1 0;
   0 0 1 1 0 1 1 1 1;
   0 0 1 1 1 0 0 0 0;
   0 0 1 1 1 0 0 0 1;
   0 0 1 1 1 0 0 1 0;
   0 0 1 1 1 0 0 1 1;
   0 0 1 1 1 0 1 0 0;
   0 0 1 1 1 0 1 0 1;
   0 0 1 1 1 0 1 1 0;
   0 0 1 1 1 0 1 1 1;
   0 0 1 1 1 1 0 0 0;
   0 0 1 1 1 1 0 0 1;
   0 0 1 1 1 1 0 1 0;
   0 0 1 1 1 1 0 1 1;
   0 0 1 1 1 1 1 0 0;
   0 0 1 1 1 1 1 0 1;
   0 0 1 1 1 1 1 1 0;
   0 0 1 1 1 1 1 1 1;
   0 1 0 0 0 0 0 0 0;
   0 1 0 0 0 0 0 0 1;
   0 1 0 0 0 0 0 1 0;
   0 1 0 0 0 0 0 1 1;
   0 1 0 0 0 0 1 0 0;
   0 1 0 0 0 0 1 0 1;
   0 1 0 0 0 0 1 1 0;
   0 1 0 0 0 0 1 1 1;
   0 1 0 0 0 1 0 0 0;
   0 1 0 0 0 1 0 0 1;
   0 1 0 0 0 1 0 1 0;
   0 1 0 0 0 1 0 1 1;
   0 1 0 0 0 1 1 0 0;
   0 1 0 0 0 1 1 0 1;
   0 1 0 0 0 1 1 1 0;
   0 1 0 0 0 1 1 1 1;
   0 1 0 0 1 0 0 0 0;
   0 1 0 0 1 0 0 0 1;
   0 1 0 0 1 0 0 1 0;
   0 1 0 0 1 0 0 1 1;
   0 1 0 0 1 0 1 0 0;
   0 1 0 0 1 0 1 0 1;
   0 1 0 0 1 0 1 1 0;
   0 1 0 0 1 0 1 1 1;
   0 1 0 0 1 1 0 0 0;
   0 1 0 0 1 1 0 0 1;
   0 1 0 0 1 1 0 1 0;
   0 1 0 0 1 1 0 1 1;
   0 1 0 0 1 1 1 0 0;
   0 1 0 0 1 1 1 0 1;
   0 1 0 0 1 1 1 1 0;
   0 1 0 0 1 1 1 1 1;
   0 1 0 1 0 0 0 0 0;
   0 1 0 1 0 0 0 0 1;
   0 1 0 1 0 0 0 1 0;
   0 1 0 1 0 0 0 1 1;
   0 1 0 1 0 0 1 0 0;
   0 1 0 1 0 0 1 0 1;
   0 1 0 1 0 0 1 1 0;
   0 1 0 1 0 0 1 1 1;
   0 1 0 1 0 1 0 0 0;
   0 1 0 1 0 1 0 0 1;
   0 1 0 1 0 1 0 1 0;
   0 1 0 1 0 1 0 1 1;
   0 1 0 1 0 1 1 0 0;
   0 1 0 1 0 1 1 0 1;
   0 1 0 1 0 1 1 1 0;
   0 1 0 1 0 1 1 1 1;
   0 1 0 1 1 0 0 0 0;
   0 1 0 1 1 0 0 0 1;
   0 1 0 1 1 0 0 1 0;
   0 1 0 1 1 0 0 1 1;
   0 1 0 1 1 0 1 0 0;
   0 1 0 1 1 0 1 0 1;
   0 1 0 1 1 0 1 1 0;
   0 1 0 1 1 0 1 1 1;
   0 1 0 1 1 1 0 0 0;
   0 1 0 1 1 1 0 0 1;
   0 1 0 1 1 1 0 1 0;
   0 1 0 1 1 1 0 1 1;
   0 1 0 1 1 1 1 0 0;
   0 1 0 1 1 1 1 0 1;
   0 1 0 1 1 1 1 1 0;
   0 1 0 1 1 1 1 1 1; 
   0 1 1 0 0 0 0 0 0;
   0 1 1 0 0 0 0 0 1;
   0 1 1 0 0 0 0 1 0;
   0 1 1 0 0 0 0 1 1;
   0 1 1 0 0 0 1 0 0;
   0 1 1 0 0 0 1 0 1;
   0 1 1 0 0 0 1 1 0;
   0 1 1 0 0 0 1 1 1;
   0 1 1 0 0 1 0 0 0;
   0 1 1 0 0 1 0 0 1;
   0 1 1 0 0 1 0 1 0;
   0 1 1 0 0 1 0 1 1;
   0 1 1 0 0 1 1 0 0;
   0 1 1 0 0 1 1 0 1;
   0 1 1 0 0 1 1 1 0;
   0 1 1 0 0 1 1 1 1;
   0 1 1 0 1 0 0 0 0;
   0 1 1 0 1 0 0 0 1;
   0 1 1 0 1 0 0 1 0;
   0 1 1 0 1 0 0 1 1;
   0 1 1 0 1 0 1 0 0;
   0 1 1 0 1 0 1 0 1;
   0 1 1 0 1 0 1 1 0;
   0 1 1 0 1 0 1 1 1;
   0 1 1 0 1 1 0 0 0;
   0 1 1 0 1 1 0 0 1;
   0 1 1 0 1 1 0 1 0;
   0 1 1 0 1 1 0 1 1;
   0 1 1 0 1 1 1 0 0;
   0 1 1 0 1 1 1 0 1;
   0 1 1 0 1 1 1 1 0;
   0 1 1 0 1 1 1 1 1;
   0 1 1 1 0 0 0 0 0;
   0 1 1 1 0 0 0 0 1;
   0 1 1 1 0 0 0 1 0;
   0 1 1 1 0 0 0 1 1;
   0 1 1 1 0 0 1 0 0;
   0 1 1 1 0 0 1 0 1;
   0 1 1 1 0 0 1 1 0;
   0 1 1 1 0 0 1 1 1;
   0 1 1 1 0 1 0 0 0;
   0 1 1 1 0 1 0 0 1;
   0 1 1 1 0 1 0 1 0;
   0 1 1 1 0 1 0 1 1;
   0 1 1 1 0 1 1 0 0;
   0 1 1 1 0 1 1 0 1;
   0 1 1 1 0 1 1 1 0;
   0 1 1 1 0 1 1 1 1;
   0 1 1 1 1 0 0 0 0;
   0 1 1 1 1 0 0 0 1;
   0 1 1 1 1 0 0 1 0;
   0 1 1 1 1 0 0 1 1;
   0 1 1 1 1 0 1 0 0;
   0 1 1 1 1 0 1 0 1;
   0 1 1 1 1 0 1 1 0;
   0 1 1 1 1 0 1 1 1;
   0 1 1 1 1 1 0 0 0;
   0 1 1 1 1 1 0 0 1;
   0 1 1 1 1 1 0 1 0;
   0 1 1 1 1 1 0 1 1;
   0 1 1 1 1 1 1 0 0;
   0 1 1 1 1 1 1 0 1;
   0 1 1 1 1 1 1 1 0;
   0 1 1 1 1 1 1 1 1;  
   1 0 0 0 0 0 0 0 0;
   1 0 0 0 0 0 0 0 1;
   1 0 0 0 0 0 0 1 0;
   1 0 0 0 0 0 0 1 1;
   1 0 0 0 0 0 1 0 0;
   1 0 0 0 0 0 1 0 1;
   1 0 0 0 0 0 1 1 0;
   1 0 0 0 0 0 1 1 1;
   1 0 0 0 0 1 0 0 0;
   1 0 0 0 0 1 0 0 1;
   1 0 0 0 0 1 0 1 0;
   1 0 0 0 0 1 0 1 1;
   1 0 0 0 0 1 1 0 0;
   1 0 0 0 0 1 1 0 1;
   1 0 0 0 0 1 1 1 0;
   1 0 0 0 0 1 1 1 1;
   1 0 0 0 1 0 0 0 0;
   1 0 0 0 1 0 0 0 1;
   1 0 0 0 1 0 0 1 0;
   1 0 0 0 1 0 0 1 1;
   1 0 0 0 1 0 1 0 0;
   1 0 0 0 1 0 1 0 1;
   1 0 0 0 1 0 1 1 0;
   1 0 0 0 1 0 1 1 1;
   1 0 0 0 1 1 0 0 0;
   1 0 0 0 1 1 0 0 1;
   1 0 0 0 1 1 0 1 0;
   1 0 0 0 1 1 0 1 1;
   1 0 0 0 1 1 1 0 0;
   1 0 0 0 1 1 1 0 1;
   1 0 0 0 1 1 1 1 0;
   1 0 0 0 1 1 1 1 1;
   1 0 0 1 0 0 0 0 0;
   1 0 0 1 0 0 0 0 1;
   1 0 0 1 0 0 0 1 0;
   1 0 0 1 0 0 0 1 1;
   1 0 0 1 0 0 1 0 0;
   1 0 0 1 0 0 1 0 1;
   1 0 0 1 0 0 1 1 0;
   1 0 0 1 0 0 1 1 1;
   1 0 0 1 0 1 0 0 0;
   1 0 0 1 0 1 0 0 1;
   1 0 0 1 0 1 0 1 0;
   1 0 0 1 0 1 0 1 1;
   1 0 0 1 0 1 1 0 0;
   1 0 0 1 0 1 1 0 1;
   1 0 0 1 0 1 1 1 0;
   1 0 0 1 0 1 1 1 1;
   1 0 0 1 1 0 0 0 0;
   1 0 0 1 1 0 0 0 1;
   1 0 0 1 1 0 0 1 0;
   1 0 0 1 1 0 0 1 1;
   1 0 0 1 1 0 1 0 0;
   1 0 0 1 1 0 1 0 1;
   1 0 0 1 1 0 1 1 0;
   1 0 0 1 1 0 1 1 1;
   1 0 0 1 1 1 0 0 0;
   1 0 0 1 1 1 0 0 1;
   1 0 0 1 1 1 0 1 0;
   1 0 0 1 1 1 0 1 1;
   1 0 0 1 1 1 1 0 0;
   1 0 0 1 1 1 1 0 1;
   1 0 0 1 1 1 1 1 0;
   1 0 0 1 1 1 1 1 1;
   1 0 1 0 0 0 0 0 0;
   1 0 1 0 0 0 0 0 1;
   1 0 1 0 0 0 0 1 0;
   1 0 1 0 0 0 0 1 1;
   1 0 1 0 0 0 1 0 0;
   1 0 1 0 0 0 1 0 1;
   1 0 1 0 0 0 1 1 0;
   1 0 1 0 0 0 1 1 1;
   1 0 1 0 0 1 0 0 0;
   1 0 1 0 0 1 0 0 1;
   1 0 1 0 0 1 0 1 0;
   1 0 1 0 0 1 0 1 1;
   1 0 1 0 0 1 1 0 0;
   1 0 1 0 0 1 1 0 1;
   1 0 1 0 0 1 1 1 0;
   1 0 1 0 0 1 1 1 1;
   1 0 1 0 1 0 0 0 0;
   1 0 1 0 1 0 0 0 1;
   1 0 1 0 1 0 0 1 0;
   1 0 1 0 1 0 0 1 1;
   1 0 1 0 1 0 1 0 0;
   1 0 1 0 1 0 1 0 1;
   1 0 1 0 1 0 1 1 0;
   1 0 1 0 1 0 1 1 1;
   1 0 1 0 1 1 0 0 0;
   1 0 1 0 1 1 0 0 1;
   1 0 1 0 1 1 0 1 0;
   1 0 1 0 1 1 0 1 1;
   1 0 1 0 1 1 1 0 0;
   1 0 1 0 1 1 1 0 1;
   1 0 1 0 1 1 1 1 0;
   1 0 1 0 1 1 1 1 1;
   1 0 1 1 0 0 0 0 0;
   1 0 1 1 0 0 0 0 1;
   1 0 1 1 0 0 0 1 0;
   1 0 1 1 0 0 0 1 1;
   1 0 1 1 0 0 1 0 0;
   1 0 1 1 0 0 1 0 1;
   1 0 1 1 0 0 1 1 0;
   1 0 1 1 0 0 1 1 1;
   1 0 1 1 0 1 0 0 0;
   1 0 1 1 0 1 0 0 1;
   1 0 1 1 0 1 0 1 0;
   1 0 1 1 0 1 0 1 1;
   1 0 1 1 0 1 1 0 0;
   1 0 1 1 0 1 1 0 1;
   1 0 1 1 0 1 1 1 0;
   1 0 1 1 0 1 1 1 1;
   1 0 1 1 1 0 0 0 0;
   1 0 1 1 1 0 0 0 1;
   1 0 1 1 1 0 0 1 0;
   1 0 1 1 1 0 0 1 1;
   1 0 1 1 1 0 1 0 0;
   1 0 1 1 1 0 1 0 1;
   1 0 1 1 1 0 1 1 0;
   1 0 1 1 1 0 1 1 1;
   1 0 1 1 1 1 0 0 0;
   1 0 1 1 1 1 0 0 1;
   1 0 1 1 1 1 0 1 0;
   1 0 1 1 1 1 0 1 1;
   1 0 1 1 1 1 1 0 0;
   1 0 1 1 1 1 1 0 1;
   1 0 1 1 1 1 1 1 0;
   1 0 1 1 1 1 1 1 1;
   1 1 0 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 1;
   1 1 0 0 0 0 0 1 0;
   1 1 0 0 0 0 0 1 1;
   1 1 0 0 0 0 1 0 0;
   1 1 0 0 0 0 1 0 1;
   1 1 0 0 0 0 1 1 0;
   1 1 0 0 0 0 1 1 1;
   1 1 0 0 0 1 0 0 0;
   1 1 0 0 0 1 0 0 1;
   1 1 0 0 0 1 0 1 0;
   1 1 0 0 0 1 0 1 1;
   1 1 0 0 0 1 1 0 0;
   1 1 0 0 0 1 1 0 1;
   1 1 0 0 0 1 1 1 0;
   1 1 0 0 0 1 1 1 1;
   1 1 0 0 1 0 0 0 0;
   1 1 0 0 1 0 0 0 1;
   1 1 0 0 1 0 0 1 0;
   1 1 0 0 1 0 0 1 1;
   1 1 0 0 1 0 1 0 0;
   1 1 0 0 1 0 1 0 1;
   1 1 0 0 1 0 1 1 0;
   1 1 0 0 1 0 1 1 1;
   1 1 0 0 1 1 0 0 0;
   1 1 0 0 1 1 0 0 1;
   1 1 0 0 1 1 0 1 0;
   1 1 0 0 1 1 0 1 1;
   1 1 0 0 1 1 1 0 0;
   1 1 0 0 1 1 1 0 1;
   1 1 0 0 1 1 1 1 0;
   1 1 0 0 1 1 1 1 1;
   1 1 0 1 0 0 0 0 0;
   1 1 0 1 0 0 0 0 1;
   1 1 0 1 0 0 0 1 0;
   1 1 0 1 0 0 0 1 1;
   1 1 0 1 0 0 1 0 0;
   1 1 0 1 0 0 1 0 1;
   1 1 0 1 0 0 1 1 0;
   1 1 0 1 0 0 1 1 1;
   1 1 0 1 0 1 0 0 0;
   1 1 0 1 0 1 0 0 1;
   1 1 0 1 0 1 0 1 0;
   1 1 0 1 0 1 0 1 1;
   1 1 0 1 0 1 1 0 0;
   1 1 0 1 0 1 1 0 1;
   1 1 0 1 0 1 1 1 0;
   1 1 0 1 0 1 1 1 1;
   1 1 0 1 1 0 0 0 0;
   1 1 0 1 1 0 0 0 1;
   1 1 0 1 1 0 0 1 0;
   1 1 0 1 1 0 0 1 1;
   1 1 0 1 1 0 1 0 0;
   1 1 0 1 1 0 1 0 1;
   1 1 0 1 1 0 1 1 0;
   1 1 0 1 1 0 1 1 1;
   1 1 0 1 1 1 0 0 0;
   1 1 0 1 1 1 0 0 1;
   1 1 0 1 1 1 0 1 0;
   1 1 0 1 1 1 0 1 1;
   1 1 0 1 1 1 1 0 0;
   1 1 0 1 1 1 1 0 1;
   1 1 0 1 1 1 1 1 0;
   1 1 0 1 1 1 1 1 1; 
   1 1 1 0 0 0 0 0 0;
   1 1 1 0 0 0 0 0 1;
   1 1 1 0 0 0 0 1 0;
   1 1 1 0 0 0 0 1 1;
   1 1 1 0 0 0 1 0 0;
   1 1 1 0 0 0 1 0 1;
   1 1 1 0 0 0 1 1 0;
   1 1 1 0 0 0 1 1 1;
   1 1 1 0 0 1 0 0 0;
   1 1 1 0 0 1 0 0 1;
   1 1 1 0 0 1 0 1 0;
   1 1 1 0 0 1 0 1 1;
   1 1 1 0 0 1 1 0 0;
   1 1 1 0 0 1 1 0 1;
   1 1 1 0 0 1 1 1 0;
   1 1 1 0 0 1 1 1 1;
   1 1 1 0 1 0 0 0 0;
   1 1 1 0 1 0 0 0 1;
   1 1 1 0 1 0 0 1 0;
   1 1 1 0 1 0 0 1 1;
   1 1 1 0 1 0 1 0 0;
   1 1 1 0 1 0 1 0 1;
   1 1 1 0 1 0 1 1 0;
   1 1 1 0 1 0 1 1 1;
   1 1 1 0 1 1 0 0 0;
   1 1 1 0 1 1 0 0 1;
   1 1 1 0 1 1 0 1 0;
   1 1 1 0 1 1 0 1 1;
   1 1 1 0 1 1 1 0 0;
   1 1 1 0 1 1 1 0 1;
   1 1 1 0 1 1 1 1 0;
   1 1 1 0 1 1 1 1 1;
   1 1 1 1 0 0 0 0 0;
   1 1 1 1 0 0 0 0 1;
   1 1 1 1 0 0 0 1 0;
   1 1 1 1 0 0 0 1 1;
   1 1 1 1 0 0 1 0 0;
   1 1 1 1 0 0 1 0 1;
   1 1 1 1 0 0 1 1 0;
   1 1 1 1 0 0 1 1 1;
   1 1 1 1 0 1 0 0 0;
   1 1 1 1 0 1 0 0 1;
   1 1 1 1 0 1 0 1 0;
   1 1 1 1 0 1 0 1 1;
   1 1 1 1 0 1 1 0 0;
   1 1 1 1 0 1 1 0 1;
   1 1 1 1 0 1 1 1 0;
   1 1 1 1 0 1 1 1 1;
   1 1 1 1 1 0 0 0 0;
   1 1 1 1 1 0 0 0 1;
   1 1 1 1 1 0 0 1 0;
   1 1 1 1 1 0 0 1 1;
   1 1 1 1 1 0 1 0 0;
   1 1 1 1 1 0 1 0 1;
   1 1 1 1 1 0 1 1 0;
   1 1 1 1 1 0 1 1 1;
   1 1 1 1 1 1 0 0 0;
   1 1 1 1 1 1 0 0 1;
   1 1 1 1 1 1 0 1 0;
   1 1 1 1 1 1 0 1 1;
   1 1 1 1 1 1 1 0 0;
   1 1 1 1 1 1 1 0 1;
   1 1 1 1 1 1 1 1 0;
   1 1 1 1 1 1 1 1 1]; 
end   
M = [];

Y=0; // zmienna pomocnicza przechowująca odkryte punkty stałe sieci

Rozmiar=size(W,'r');
printf('Rozmiar wejscia: %d\n',Rozmiar);

N=2^Rozmiar; // liczba wszystkich możliwych wektorów na wejściu
printf('Liczba wektorow wejsciowych: %d\n',N);

printf('Tryb działania sieci: asynchroniczny.\n');

printf('BADANIE ZBIEŻNOŚCI\n\n');

for j=1:N
    krok = 1;
    k = 1;
    U = zeros(Rozmiar, 1);
    Vk = zeros(Rozmiar, 1);
    Vk = X(j,:)';
    //Vk_1 = V;
    printf('Krok : %d \n', j);
    printf('Macierz wag')
    disp(W);
    printf('BADANIE WEKTORA NR %d \n', j);
    disp(Vk');
    //printf('Potencjał wejsciowy \n');
    
    //dla [0,0,1]
    U = W * Vk;//[-1,1,0]
    //disp(U');
    V = Vk; //[0,0,1]
    Vk_1 = Vk;
    
    P = 2//dla szybszego wyniku
    procesy = 4^2^(P-1);
    
    for i = 0: procesy
        
        krok = modulo(i,Rozmiar) + 1;
        if i ~= 0 then 
            printf('KROK NW : %d \n', krok );
            //printf('Potencjał wejsciowy U(%d) \n', i + 1);
            U = W * Vk;    
            //disp(U');
        end


        V(krok, :) = U(krok, :);
        printf('Potencjal wejściowy %d V \n',i + 1);
        disp(Vk');//[-1,0,1]
        printf('Potencjal wyjsciowy V(%d) \n', i + 1);
        Vu = unipolar(V);
        disp(Vu'); //[0,0,1]      
        V = Vu;
        Vk = V;
        
        eTeraz = energia(W, Vk);
        if i == 0 then
            ePoprzednia = eTeraz;
            printf('E(%d) = %d\n', i, ePoprzednia);
        else 
            if ePoprzednia <= eTeraz then
                printf('E(%d) = %d\n', i, eTeraz);
                printf('E(%d) <= E(%d)\n', i, i-1)
                ePoprzednia = eTeraz;
            else
                printf('E(%d) = %d\n', i, eTeraz);
                printf('E(%d) > E(%d)\n', i, i-1)
                ePoprzednia = eTeraz;    
            end
        end
    end
    
    //if Vk_1 == Vk then
        printf('Zbieżny do: ');
        disp(Vk');
        //M = [M ; Vk_1'];
        if size(Y,'c')==1 then
                Y=Vk';
        else
            if isInMatrix(Y,Vk')==%f then
                Y=[Y; Vk'];
            end
        end 
    //end
end
M = Y;
endfunction


function [M] = bipolarna(W, P)
RozmiarKolumn = size(W, 'c');

if RozmiarKolumn == 3 then
X=[ -1 -1 -1;
    -1 -1  1;
    -1  1 -1;
    -1  1  1;
     1 -1 -1;
     1 -1  1;
     1  1 -1;
     1  1  1];
end

if RozmiarKolumn == 6 then
X=[-1 -1 -1 -1 -1 -1;
   -1 -1 -1 -1 -1  1;
   -1 -1 -1 -1  1 -1;
   -1 -1 -1 -1  1  1;
   -1 -1 -1  1 -1 -1;
   -1 -1 -1  1 -1  1;
   -1 -1 -1  1  1 -1;
   -1 -1 -1  1  1  1;
   -1 -1  1 -1 -1 -1;
   -1 -1  1 -1 -1  1;
   -1 -1  1 -1  1 -1;
   -1 -1  1 -1  1  1;
   -1 -1  1  1 -1 -1;
   -1 -1  1  1 -1  1;
   -1 -1  1  1  1 -1;
   -1 -1  1  1  1  1;
   -1  1 -1 -1 -1 -1;
   -1  1 -1 -1 -1  1;
   -1  1 -1 -1  1 -1;
   -1  1 -1 -1  1  1;
   -1  1 -1  1 -1 -1;
   -1  1 -1  1 -1  1;
   -1  1 -1  1  1 -1;
   -1  1 -1  1  1  1;
   -1  1  1 -1 -1 -1;
   -1  1  1 -1 -1  1;
   -1  1  1 -1  1 -1;
   -1  1  1 -1  1  1;
   -1  1  1  1 -1 -1;
   -1  1  1  1 -1  1;
   -1  1  1  1  1 -1;
   -1  1  1  1  1  1;
    1 -1 -1 -1 -1 -1;
    1 -1 -1 -1 -1  1;
    1 -1 -1 -1  1 -1;
    1 -1 -1 -1  1  1;
    1 -1 -1  1 -1 -1;
    1 -1 -1  1 -1  1;
    1 -1 -1  1  1 -1;
    1 -1 -1  1  1  1;
    1 -1  1 -1 -1 -1;
    1 -1  1 -1 -1  1;
    1 -1  1 -1  1 -1;
    1 -1  1 -1  1  1;
    1 -1  1  1 -1 -1;
    1 -1  1  1 -1  1;
    1 -1  1  1  1 -1;
    1 -1  1  1  1  1;
    1  1 -1 -1 -1 -1;
    1  1 -1 -1 -1  1;
    1  1 -1 -1  1 -1;
    1  1 -1 -1  1  1;
    1  1 -1  1 -1 -1;
    1  1 -1  1 -1  1;
    1  1 -1  1  1 -1;
    1  1 -1  1  1  1;
    1  1  1 -1 -1 -1;
    1  1  1 -1 -1  1;
    1  1  1 -1  1 -1;
    1  1  1 -1  1  1;
    1  1  1  1 -1 -1;
    1  1  1  1 -1  1;
    1  1  1  1  1 -1;
    1  1  1  1  1  1];
end
    
M = [];

Y=0; // zmienna pomocnicza przechowująca odkryte punkty stałe sieci

Rozmiar=size(W,'r');
printf('Rozmiar wejscia: %d\n',Rozmiar);

N=2^Rozmiar; // liczba wszystkiech możliwych wektorów na wejściu
printf('Liczba wektorow wejsciowych: %d\n',N);

printf('Tryb działania sieci: asynchroniczny.\n');

printf('BADANIE ZBIEŻNOŚCI\n\n');

for j=1:N
    krok = 1;
    k = 1;
    U = zeros(Rozmiar, 1);
    Vk = zeros(Rozmiar, 1);
    Vk = X(j,:)';
    //Vk_1 = V;
    printf('Krok : %d \n', j);
    printf('Macierz wag')
    disp(W);
    printf('BADANIE WEKTORA NR %d \n', j);
    disp(Vk');
    //printf('Potencjał wejsciowy \n');
    
    //dla [0,0,1]
    U = W * Vk;//[-1,1,0]
    //disp(U');
    V = Vk; //[0,0,1]
    Vk_1 = Vk;
    
    P = 2//dla szybszego wyniku
    procesy = 4^2^(P-1);
    
    for i = 0: procesy
        
        krok = modulo(i,Rozmiar) + 1;
        if i ~= 0 then 
            printf('KROK NW : %d \n', krok );
            //printf('Potencjał wejsciowy %d \n', i + 1);
            U = W * Vk;    
            //disp(U');
        end


        V(krok, :) = U(krok, :);
        printf('Potencjal wejściowy U(%d) \n',i + 1);
        disp(Vk');//[-1,0,1]
        printf('Potencjal wyjsciowy V(%d) \n', i + 1);
        Vu = bipolar(V);
        disp(Vu'); //[0,0,1]      
        V = Vu;
        Vk = V;
        eTeraz = energia(W, Vk);
        if i == 0 then
            ePoprzednia = eTeraz;
            printf('E(%d) = %d\n', i, ePoprzednia);
        else 
            if ePoprzednia <= eTeraz then
                printf('E(%d) = %d\n', i, eTeraz);
                printf('E(%d) <= E(%d)\n', i, i-1)
                ePoprzednia = eTeraz;
            else
                printf('E(%d) = %d\n', i, eTeraz);
                printf('E(%d) > E(%d)\n', i, i-1)
                ePoprzednia = eTeraz;    
            end    
        end
        
        //printf('E: %d\n', energia(W, Vk));
    end
   
    //if Vk_1 == Vk then
        printf('Zbieżny do: ');
        disp(Vk_1');
        //M = [M ; Vk_1'];
        if size(Y,'c')==1 then
                Y=Vk_1';
        else
            if isInMatrix(Y,Vk_1')==%f then
                Y=[Y; Vk_1'];
            end
        end 
    //end
    
    

end
M = Y;
endfunction


function [wy]=unipolar(a)
    [row col]=size(a);
    if row*col<>1 then
        wy=zeros(row,col);
        for i = 1:row
            for j = 1:col
                wy(i,j) = unipolar(a(i,j));
            end;
        end
    else
        if a > 0 then
            wy=1;
        else
            wy=0;
        end        
    end
endfunction

function wy_log=isInMatrix(Y,X) // funkcja pomocnicza, sprawdza czy wektor X znajduje się już w macierzy Y
    
    if size(Y,'c') <> size(X,'c') | size(X,'r') <> 1 then
        printf('Niepoprawne dane wejściowe: wymiar kolumn dla obu macierzy nie jest zgodny lub macierz druga nie jest wektorem wierszowym.');
    end
    
    wy_log=%f;
    for i=1:size(Y,'r')
        if Y(i,:) == X then
            wy_log=%t
        end
    end
endfunction

function [wy]=bipolar(a)
    [row col]=size(a);
    if row*col<>1 then
        wy=zeros(row,col);
        for i = 1:row
            for j = 1:col
                wy(i,j) = bipolar(a(i,j));
            end;
        end
    else
        if a > 0 then
            wy=1;
        else
            wy=-1;
        end        
    end
endfunction

function [Z] = RegulaHebba(X)
    RozmiarK = size(X, 'c');
    RozmiarW = size(X, 'r');
    W = zeros(RozmiarK, RozmiarK);
    row = size(W,'r');
    col = size(W, 'c');
   
    for i = 1: row
        for j = 1: col
            for k = 1: RozmiarW
                if i <> j then
                    W(i,j) = W(i,j) + (X(k,i) * X(k,j));
                else 
                    W(i,j) = 0;
                end
            end
        end    
    end 
    Z = W/3;   
endfunction

function [W] = pseudoinwersja(X)
    w = det(X);
    if w <> 0 then
        [W] = X' * (X * X')^(-1) * X;
    end
endfunction

function czyLiniowoNiezalezne(X)
w = det(X);
printf("Czy Liniowo niezalezna : %d \n ",w);
endfunction


function [Z] = czyRozpoznane(P,V)
    printf('Macierz wektorow Rozpoznanych : \n ' );
    disp(P);
    printf('Macierz V : \n ' );
    disp(V);
    Z = [];
    Rozmiar = size(V, 'r');
    for i = 1: Rozmiar
        if isInMatrix(P, V(i,:)) then
            //printf("jest \n");
            //disp(V(i,:));
            Z = [Z; V(i,:)];
    else
        //printf("nie ma \n");
        end
    end
endfunction

function printC(Z)
    RozmiarK = size(Z , 'c');
    for i = 1 : RozmiarK
        if Z(1,i) == 1 then
            printf('#');
        else
            printf("*");
        end
        if modulo(i,3) == 0 then
            printf('\n');
        end  
    end
endfunction

function printMacierz(Z)
    RozmiarK = size(Z, 'c');
    RozmiarW = size(Z, 'r');
    for i = 1 : RozmiarW
        for j = 1: RozmiarK
            if Z(i,j) == 1 then
                printf('#');
            else
                printf("*");
            end
        end
        printf("\n");
    end
endfunction

function [Z] = asynchronicznaSH(W, pattern, V, ac)
    r = size (W, 'c');
    if W == -1 then
        
        printf('Regula Heba \n');
        //V1 = RegulaHebba(pattern);
        //czyLiniowoNiezalezne(pattern);
        //printf("Metoda Pseudoinwersji")
        [V1] = pseudoinwersja(pattern);
        if ac == 1 then 
            liczbaWzorcow = size(pattern, "r");
            P = unipolarna(V1, liczbaWzorcow);
            printf('Macierz wektorów zbieżnych: \n');
            disp(P);
            printf('Macierz V: \n' );
            disp(V);
            Z = czyRozpoznane(P, V);
            printf("Macierz Z: \n");
            disp(Z);
            printf("Wektor poczatkowy \n")
            printMacierz(pattern);
            printf("Wektor koncowy \n");
            printMacierz(Z);
            //printC(Z);dla przykladu Cj
            //printf('Regula Heba\n');
            //disp(V1);
            
        end
        if ac == -1 then
            liczbaWzorcow = size(pattern, "r");
            P = bipolarna(V1, liczbaWzorcow);
            printf('Macierz wektorów zbieżnych: \n');
            disp(P);
            printf('Macierz V : \n' );
            disp(V);
            Z = czyRozpoznane(P, V);
            printf("Wypisania Macierzy Z \n");
            disp(Z);
            printC(Z);
        end
    else 
        if pattern == -1 then
            printf('Regula Heba \n');
            disp(W);
            if ac == 1 then 
                P = unipolarna(W,16);
                printf('Macierz wektorów zbieżnych: \n');
                disp(P);
                printf('Macierz V: \n' );
                disp(V);
                Z = czyRozpoznane(P, V);
                //printf("Macierzy Z: \n");
                //disp(Z);
                //printC(Z);
            
            end
        
            if ac == -1 then
                P = bipolarna(W, 16);
                printf('Macierz wektorów zbieżnych: \n');
                disp(P);
                printf('Macierz V: \n' );
                disp(V);
                Z = czyRozpoznane(P, V);
                //printf("Macierz Z: \n");
                //disp(Z);
                //printC(Z);
            end
        end
    end
    
endfunction

WAsynchUni = [ 0 2 -1;
               1 0  1;
              -1 1  0];
              
WAsynchBip = [ 0 -1 -3;
              -1  0  2;
              -3  2  0];
              
Cjeden = [0 1 0 1 1 0 0 1 0];
      
Cj = [1 1 1 1 0 0 1 1 1];

Vjeden = [1 0 0 1 0 0;
          0 0 1 1 0 0;
          0 1 0 1 0 0;
          0 0 0 1 0 0;
          0 0 0 1 0 1;
          0 0 0 1 1 0];
        
        
Vjeden1 = [0 0 0 1 0 0;
          0 0 1 1 0 0;
          0 1 0 1 0 0;
          1 0 0 1 0 0;
          0 0 0 1 0 0;
          0 0 0 1 0 0];
        
Vcztery = [0 0 0 1 0 0;
           0 0 1 1 0 0;
           0 1 0 1 0 0;
           1 1 1 1 0 0;
           0 0 0 1 1 0;
           1 1 0 1 0 1];
        
Vcztery1 = [0 0 0 1 0 0;
           0 0 1 1 0 0;
           0 1 0 1 0 0;
           1 1 1 1 0 0;
           0 0 0 1 0 0;
           0 0 0 1 0 0];
        
VL = [1 1 0 0 0 0;
      0 1 0 0 0 0;
      0 1 1 1 0 0;
      0 1 0 1 1 0;
      0 1 0 0 1 0;
      0 1 1 1 0 1];
        
VL1 = [0 1 0 0 0 0;
      0 1 0 0 0 0;
      0 1 0 0 0 0;
      0 1 0 0 0 0;
      0 1 0 0 0 0;
      0 1 1 1 0 0];

Cv1 = [-1 1  1];
Cv2 = [-1 1 -1];
Cv3 = [ 1 1 -1];

Cv = [Cv1;Cv2;Cv3];

Cx1 = [0 1 1];
Cx2 = [0 1 0];
Cx3 = [1 1 0];

Cx = [Cx1;Cx2;Cx3];

printf('PROGRAM NAPISANY NA ĆWICZENIA - ZAAWANSOWANE METODY SZTUCZNEJ INTELIGENCJI\n autorzy: Paweł Mazur, Piotr Mazur\n\n');

//dla Podpunktu b
//regula Hebba unipolarna
//Z = asynchronicznaSH(-1, Cj, Cj, 1);
//dla pesudoinwersji unipolarna
Z = asynchronicznaSH(-1, Vjeden, Vjeden1, 1);
//Z = asynchronicznaSH(-1, Vcztery, Vcztery1, 1);
//Z = asynchronicznaSH(-1, VL, VL1, 1);
//regula Hebba bipolarna
//dla pesudoinwersji bipolarna
//Z = asynchronicznaSH(-1, Cv, Cv, -1);
//dla Podpunktu a
//z wagami bipolarna
//Z = asynchronicznaSH(WAsynchBip, -1, Cx, -1);
//z wagami unipolarna
//Z = asynchronicznaSH(WAsynchUni, -1, Cv, 1);





