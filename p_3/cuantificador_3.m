function Yout = cuantificador_3(Xin, Nbits, Obits)
    P = (2^Obits/(2^Nbits))-1 : 2^Obits/(2^Nbits) : 2^Obits-1;
    Yout = quantiz (Xin,P);
end