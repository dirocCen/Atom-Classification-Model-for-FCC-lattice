function  res = transform_fcc(F)
    F1 = F;
    F2 = [F(3) F(2) F(1) F(4) F(5) F(6)];
    F3 = [F(1) F(4) F(3) F(2) F(5) F(6)];
    F4 = [F(1) F(2) F(3) F(4) F(6) F(5)];
    
    F5 = [F(3) F(4) F(1) F(2) F(5) F(6)];
    F51 = [F(2) F(1) F(4) F(3) F(5) F(6)];
    F52 = [F(4) F(3) F(2) F(1) F(5) F(6)];
    F6 = [F(1) F(4) F(3) F(2) F(6) F(5)];
    F61 = [F(1) F(6) F(3) F(5) F(4) F(2)];
    F62 = [F(1) F(5) F(3) F(6) F(2) F(4)];
    F7 = [F(3) F(2) F(1) F(4) F(6) F(5)];
    F71 = [F(5) F(2) F(6) F(4) F(1) F(3)];
    F72 = [F(6) F(2) F(5) F(4) F(3) F(1)];
    F8 = [F(3) F(4) F(1) F(2) F(6) F(5)];
    FF=[F1;F2;F3;F4;F5;F51;F52;F6;F61;F62;F7;F71;F72;F8];
    FFF=[];
    for ii=1:size(FF,1)
        F11=[FF(ii,4) FF(ii,1) FF(ii,2) FF(ii,3) FF(ii,5) FF(ii,6)];
        F12=[FF(ii,3) FF(ii,4) FF(ii,1) FF(ii,2) FF(ii,5) FF(ii,6)];
        F13=[FF(ii,2) FF(ii,3) FF(ii,4) FF(ii,1) FF(ii,5) FF(ii,6)];
        F14=[FF(ii,1) FF(ii,6) FF(ii,3) FF(ii,5) FF(ii,2) FF(ii,4)];
        F15=[FF(ii,1) FF(ii,4) FF(ii,3) FF(ii,2) FF(ii,6) FF(ii,5)];
        F16=[FF(ii,1) FF(ii,5) FF(ii,3) FF(ii,6) FF(ii,4) FF(ii,2)];
        F17=[FF(ii,6) FF(ii,2) FF(ii,5) FF(ii,4) FF(ii,1) FF(ii,3)];
        F18=[FF(ii,3) FF(ii,2) FF(ii,1) FF(ii,4) FF(ii,6) FF(ii,5)];
        F19=[FF(ii,5) FF(ii,2) FF(ii,6) FF(ii,4) FF(ii,3) FF(ii,1)];
        FFF= [FFF;F11;F12;F13;F14;F15;F16;F17;F18];
    end
    FFF= [FFF;FF];
    res=unique(FFF,'rows');
end

