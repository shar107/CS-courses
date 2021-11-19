#Experiment 5.

#IMPLEMENTATION OF INDEX COMPRESSION TECHNIQUES: Elias gamma and Golomb encoding & decoding. 


#‣ Elias Gamma Encoding

from math import log
log2 = lambda x: log(x, 2)
def Unary(x):
 return (x-1)*'0'+'1'
def Binary(x, l = 1):
 s = '{0:0%db}' % l
 return s.format(x)
def Elias_Gamma(x):
 if x == 0:
 return '0'
 n = 1 + int(log2(x))
 b = x - 2**(int(log2(x)))
 l = int(log2(x))
 return Unary(n) + Binary(b, l)
print(Elias_Gamma(10))



#‣ Elias Gamma Decoding

import math
def decode(x):
 num=0;
 for i in range(len(x)):
 num+=(int(x[len(x)-1-i])*(math.pow(2,i)));
 return num;
x=str(input('Enter code: '));
if(x=='1'):
 print('1');
 exit;
else:
 x=list(x);
 t=0;
 v=[];
 b=0;
 w=[];
 c=0;
 for i in x:
 if(b!=1):
 if(i=='0'):
 t+=1;
 else:
 v.append(i);
 b=1;
 elif(c!=1):
 if(t==0):
 c=1;
 w.append('1');
 w.append(i);
 else:
 v.append(i);
 t-=1;
 else:
 num=decode(v);
 if(num==0):
 break;
 else:
 w.append(i);
 num-=1;
 ans=decode(w);
print('Original Number: ',int(ans));



#‣ Golomb Encoding

import math
def decode(t):
 x=[];
 if(t==0):
 return [0];
 while(t>0):
 x.append(t%2);
 t=int(t/2);
 return x
def unary(t):
 y=[];
 for i in range(t-1):
 y.append(0);
 y.append(1)
 return y;
x=int(input('Enter a number: '))
b=int(input('Enter value of b: '))
q=int(x/b)
y=unary(q+1)
r=x-(q*b)
i=math.floor(math.log(b,2));
d=math.pow(2,i+1)-b;
if(r>=d):
 r+=int(d);
r2=decode(r);
if(len(r2)<=i and r>=d):
 r2.append(0);
if(len(r2)<i and r<d):
 r2.append(0);
r2=r2[::-1];
y=y+r2;
print('Code: ',y);



#‣ Golomb Decoding

import math
def decode(x):
 num=0;
 for i in range(len(x)):
 num+=(int(x[len(x)-1-i])*(math.pow(2,i)));
 return num;
x=str(input('Enter code: '))
x=list(x)
b=int(input('Enter value of b: '))
i=math.floor(math.log(b,2))
d=math.pow(2,i+1)-b
p2=0;
l=1;
while(p2<len(x)):
 t=0;
 flag=0;
 r=[];
 k=i;
 q=0;
 for p in range(p2,len(x)):
 if(x[p]=='0' and flag==0):
 t+=1;
 continue;
 if(x[p]=='1' and flag==0):
 q=t;
 flag=1;
 continue;
 r.append(x[p]);
 k-=1;
 if(k==0):
 rnum=decode(r);
 if(rnum<d):
 p2=p+1;
 break;
 if(k==-1):
 rnum=decode(r);
 rnum=rnum-d;
 p2=p+1;
 break;
 ans=q*b+rnum;
print(ans);
l=0;