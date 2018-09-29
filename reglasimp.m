function rt=reglasimp(a,b,fu,n)
syms x lp
delta=(b-a)/n;
 nod(1)=a;
 fnod(1)=double(subs(fu,nod(1)));
 figure,fplot(fu,[a,b],'b')
 hold on
 grid on
for i=1:n+1
    nod(i+1)=a+((i)*delta);
    fnod(i+1)=double(subs(fu,nod(i+1)));
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
for k=1:n
    plot(nod(k),fnod(k),'o','MarkerFaceColor','r')
end
hold off
for k=1:n
    nodinter(k)=(nod(k)+nod(k+1))/2;
    nodel(k)=(nod(k+1)-nod(k));
    fnodin(k)=double(subs(fu,nodinter(k)));
    cambk(k)=(nod(k+1)-nod(k))/2;
    r(k)=(cambk(k)/3)*(fnod(k)+4*fnodin(k)+fnod(k+1));
end
rt=sum(r);
end