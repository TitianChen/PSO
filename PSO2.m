function [xm,fv] = PSO2( fitness,N,c1,c2,lamda,M,D )
for i = 1:N
    for j = 1:D
        x(i,j) = randn;%随机初始化位置
        v(i,j) = randn;%随机初始化位置
    end
end
%-----先计算各个粒子的适应度并初始化Pi和Pg----
for i = 1:N
    p(i) = fitness(x(i,:));
    if(p(i)==10000000000000000)  
        while(1)
            for j = 1:D
                x(i,j) = radn;%随机初始化位置
                v(i,j) = randn;%随机初始化速度
            end
            p(i) = fitness(x(i,:));
            if(p(i) ~= 'No')
                break;
            end
        end
    end
    y(i,:) = x(i,:);
end
pg = x(N,:);   %Pg为全局最优
for i = 1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg = x(i,:);
    end
end
%进入主要循环，按照公式依次迭代
T = -fitness(pg)/log(0.2);
for t = 1:M
    groupFit = fitness(pg);
    for i = 1:N
        Tfit(i) = exp(-(p(i)-groupFit)/T);
    end
    SumTfit = sum(Tfit);
    Tfit = Tfit/SumTfit;
    pBet = rand();
    for i = 1:N
        ComFit(i) = sum(Tfit(1:i));
        if pBet <= ComFit(i)
            pg_plus = x(1,:);
            break;
        end
    end
    C = c1+c2;
    ksi = 2/abs(2-C-sqrt(C^2-4*C));
    for i = 1:N
        v(i,:) = ksi*(v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg_plus-x(i,:)));
        x(i,:) = x(i,:)+v(i,:);
        if fitness(x(i,:))<p(i)
            p(i) = fitness(x(i,:));
            y(i,:) = x(i,:);
        end
        if p(i) < fitness(pg)
            pg = y(i,:);
        end
    end
    T = T*lamda;
    Pbest(t) = fitness(pg);
end
xm = pg';
fv = fitness(pg);

    
        
    
            
            
    end
    
        
end
end

