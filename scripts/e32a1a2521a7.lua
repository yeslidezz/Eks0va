return(function(...)local j={"69igxMJrav8=";"PvJhtviK";"9+Enth==";"9+ESaMNgVC==";"9+EYWvU=","zFNjxFIXelElt9xqWugjzF6TP9igxMioanNgankqtuE1ebggxuwSWd6XVTE/zbIhPM4oav/SaTEiZZ7ZauwrxM/tWvJo";"pFNjx4PgPC==";"adErWFijxMgqWh==","zFNjxFIXelE0z9iLab70eMioapErxd0oPu6TzdEozbIoIZI+IsthiLxwIZCuisIuIyCUmQA1VvJW80W0Ndrspv1Yav8bz00j6dI+i4ETIQ+1N6kwmvPex+24iZ4JZbgHIF/Nzg7/N4NrWy6WZvJ1Nj+Y6v7tabSlNC==";"p9iYtvJ0tMEJV90yIk==";"6u6TzdEozh==";"Iur7Ng/p8nkwkvgTmZC=","Wu/1Wk=="}for I,T in ipairs({{1,13};{1,8};{9;13}})do while T[1]<T[2]do j[T[1]],j[T[2]],T[1],T[2]=j[T[2]],j[T[1]],T[1]+1,T[2]-1 end end local function I(I)return j[I-24035]end do local I=j local T=type local i=table.insert local q=string.len local c={["4"]=4;l=50;P=29;q=46,w=49,V=30,B=62,Z=19,["2"]=1;R=40;f=31,["9"]=23;r=33;C=0,E=61,N=17,A=60,Y=44,o=47,d=6;J=57,["8"]=20,["/"]=5;["0"]=36,X=58,s=3,S=41;W=25,m=14,e=11;M=38;O=32;g=37;["5"]=59;x=28,["6"]=21,n=39;["7"]=9,T=34;v=22;i=13;c=8,L=35,["3"]=10;b=55,F=7,["+"]=53;K=43,p=18;a=27;Q=2,u=54,z=26;I=12;U=56,H=15;h=48;D=42;j=52;t=24,k=16,y=51;G=63;["1"]=45}local o=string.sub local E=math.floor local K=table.concat local B=string.char for j=1,#I,1 do local C=I[j]if T(C)=="string"then local T=q(C)local M={}local z=1 local V=0 local p=0 while z<=T do local j=o(C,z,z)local I=c[j]if I then V=V+I*64^(3-p)p=p+1 if p==4 then p=0 local j=E(V/65536)local I=E((V%65536)/256)local T=V%256 i(M,B(j,I,T))V=0 end elseif j=="="then i(M,B(E(V/65536)))if z>=T or o(C,z+1,z+1)~="="then i(M,B(E((V%65536)/256)))end break end z=z+1 end I[j]=K(M)end end end return(function(j,i,q,c,o,E,K,B,p,T,C,z,V,a,M,n)z,V,n,T,p,B,C,a,M=0,function(j)for I=1,#j,1 do C[j[I]]=C[j[I]]+1 end if q then local T=q(true)local i=o(T)i[I(24047)],i[I(24046)],i[I(24048)]=j,p,function()return-2182595 end return T else return c({},{[I(24046)]=p;[I(24047)]=j,[I(24048)]=function()return-2182595 end})end end,function(j,I)local i=V(I)local q=function(...)return T(j,{...},I,i)end return q end,function(T,q,c,o)local M,K,V,z,a,C,p,B while T do a=I(24037)M=I(24038)z=I(24043)T=I(24040)B=q K=I(24044)C=I(24041)j[K]=T K=I(24039)T=j[I(24042)]j[C]=K C=j[M]p=I(24036)V=j[z]a=V[a]K={}z={a(V,p)}M=C(i(z))C=M()end T=#o return i(K)end,function(j)local I,T=1,j[1]while T do C[T],I=C[T]-1,1+I if C[T]==0 then C[T],B[T]=nil,nil end T=j[I]end end,{},{},function(j)C[j]=C[j]-1 if 0==C[j]then C[j],B[j]=nil,nil end end,function()z=1+z C[z]=1 return z end return(n(13262741,{}))(i(K))end)(getfenv and getfenv()or _ENV,unpack or table[I(24045)],newproxy,setmetatable,getmetatable,select,{...})end)(...)