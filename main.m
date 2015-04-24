load('data.mat');
disp('When the original W is inside the ball...');
[W, log] = myoptimization(Y,X,1000*ones(1,70)/1,36.8,0); plot(log);
disp('When the original W is outside the ball...');
[W, log] = myoptimization(Y,X,1000*ones(1,70)/1,35,0); plot(log);
disp('Incremental run....');
[W, log] = myoptimization(Y,X,1000*ones(1,70)/1,36.8,1); plot(log);
