function [rs,pp]=reglatres8vos(a,b,fu,n)
syms x lp
delta=(b-a)/n;
figure,fplot(fu,[a,b],'b')
hold on
grid on
nod(1)=a;
fnod(1)=double(subs(fu,nod(1)));
for i=1:n+1
    nod(i+1)=a+(i*delta);
    fnod(i+1)=double(subs(fu,nod(i+1)));
    delta3(i)=(nod(i+1)-nod(i))/3;
end
for i=1:length(nod)
    for k=1:length(nod)
        if i~=k
        lp(i,k)=(x-nod(k))/(nod(i)-nod(k));
        else
            lp(i,k)=1;
        end 
       
    end
end
lpp=prod(lp,2);
for q=1:length(fnod)
    p(q)=fnod(q)*lpp(q);
    pp=sum(p);
end
fplot(pp,[a,b],'r')
for j=1:n
     nod1(j)=nod(j)+delta*(1/3);
    nod2(j)=nod(j)+delta*(2/3);
    fnod1(j)=double(subs(fu,nod1(j)));
    fnod2(j)=double(subs(fu,nod2(j)));
    plot(nod(j),fnod(j),'o','MarkerFaceColor','r')
end
hold off
for k=1:n
    r(k)=(3/8)*delta3(k)*(fnod(k)+3*fnod1(k)+3*fnod2(k)+fnod(k+1));
end
rs=sum(r);
end