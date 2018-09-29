function a1=reglatrap(a,b,fu,n)
syms x recta
del=(b-a)/n;
part(1)=a;
fpart(1)=double(subs(fu,part(1)));
figure,fplot(fu,[a,b],'b')
grid on
hold on
for i=1:n
   part(i+1)=a+(i*del); 
   fpart(i+1)=double(subs(fu,part(i+1)));
   deltat(i)=part(i+1)-part(i);
   fdeltat(i)=double(subs(fu,part(i)));
   pendi(i)=(fpart(i+1)-fpart(i))/(part(i+1)-part(i));
   recta(i)=(pendi(i)*(x-part(i)))+fpart(i);
   fplot(recta(i),[part(i),part(i+1)],'r')
end
for k=1:n+1
     plot(part(k),fpart(k),'o','MarkerFaceColor','r')
     
end
hold off
for j=1:n-1
    rt(j)=(deltat(j)/2)*(fdeltat(j)+fdeltat(j+1));
end
a1=sum(rt);
end