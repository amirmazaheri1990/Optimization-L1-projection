function [W,log] = myoptimization(Y,X,W0,C,incremental)
log = [];
if(~incremental),
W = W0;

iteration = 0;
step = 1;
lambda = 5;
 W_temp = projection(W,C);
 W = matrixUpdater(W,W_temp);
    err =norm(norm(Y-W*X') );

while(err>0.0001),
    
    %pause(0.2);
  
        delta_W = -1*(-2*(Y-W*X')*X)*step;
   
    %disp(num2str(norm(delta_W)));
    W2 = W + delta_W;
    %bar(delta_W)
    
    %pause(2);
    
    W2_temp = projection(W2,C);
    W2 = matrixUpdater(W2,W2_temp);
    err2 = norm(norm(Y-W2*X'));
    
    iteration = iteration + 1;
    if(err2<err),
        
        %step = (3/2)*step;
        
        W = W2;
        err = err2;
        
        
    else
  
            step = step*0.5;
        
    end
    disp(['err is : ',num2str(err), '; in iteration : ',num2str(iteration),...
        '; step is : ',num2str(step),'; |w| is : ',num2str(sum(abs(W)))]);
     if (mod(iteration,100)==0),
        log = [log,norm(Y-W*X')];
    end
    if(iteration > 100000 || step < 10^(-8)),
        break;
    end
end
return;
else
    W = W0;

iteration = 0;
step = 1;
lambda = 5;
 W_temp = projection(W,C);
 W = matrixUpdater(W,W_temp);
    err =norm(norm(Y-W*X') );

while(err>0.0001),
    
    %pause(0.2);
        random = rand(1,30);
        random = ceil(size(X,1)*random);
        
        random_X = X(random,:);
        random_Y = Y(:,random);
        delta_W = -1*(-2*(random_Y-W*random_X')*random_X)*step;
   
    %disp(num2str(norm(delta_W)));
    W2 = W + delta_W;
    %bar(delta_W)
    
    %pause(2);
    
    W2_temp = projection(W2,C);
    W2 = matrixUpdater(W2,W2_temp);
    err2 = norm(norm(Y-W2*X'));
    
    iteration = iteration + 1;
    if(err2<err),
        
        %step = (3/2)*step;
        
        W = W2;
        err = err2;
        
        
    else
            if(err < 1/2*err2),
            step = step*0.5;
            end
    end
    disp(['err is : ',num2str(norm(Y-W*X')), '; in iteration : ',num2str(iteration),...
        '; step is : ',num2str(step),'; |w| is : ',num2str(sum(abs(W)))]);
    if (mod(iteration,100)==0),
        log = [log,norm(Y-W*X')];
    end
    if(iteration > 10000 || step < 10^(-8)),
        break;
    end
end
return;
    
end
end