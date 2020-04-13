%% test 1
% dejong
filename    = 'dejong.txt';
f           = @dejong;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f1_c1c2,c1c2best1] = myPSOc1c2(filename,f,xbest_known,xrange);
% ackley
filename    = 'ackley.txt';
f           = @ackley;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f2_c1c2,c1c2best2] = myPSOc1c2(filename,f,xbest_known,xrange);
% rastrigin
filename    = 'rastrigin.txt';
f           = @rastrigin;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f3_c1c2,c1c2best3] = myPSOc1c2(filename,f,xbest_known,xrange);
% rosenbrock
filename    = 'rosenbrock.txt';
f           = @rosenbrock;
xbest_known = [1 1 1];
xrange      = [100, 150, 70];
[mse_f4_c1c2,c1c2best4] = myPSOc1c2(filename,f,xbest_known,xrange);
% branins
% 2-dimensional function, usually evaluated on x1 in [-5,10]; x2 in [0,15]
% it has 3 global minima
filename1    = 'branins1.txt';
filename2    = 'branins2.txt';
filename3    = 'branins3.txt';
f           = @branins;
xbest_known = [-pi, 12.275; pi, 2.275; 9.42478, 2.475];
xrange      = [20,30];
[mse_f51_c1c2,c1c2best51] = myPSOc1c2(filename1,f,xbest_known(1,:),xrange);
[mse_f52_c1c2,c1c2best52] = myPSOc1c2(filename2,f,xbest_known(2,:),xrange);
[mse_f53_c1c2,c1c2best53] = myPSOc1c2(filename3,f,xbest_known(3,:),xrange);


%% test 2
% dejong
filename    = 'dejong.txt';
f           = @dejong;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f1_Kw,Kwbest1] = myPSOKw(filename,f,xbest_known,xrange);
% ackley
filename    = 'ackley.txt';
f           = @ackley;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f2_Kw,Kwbest2] = myPSOKw(filename,f,xbest_known,xrange);
% rastrigin
filename    = 'rastrigin.txt';
f           = @rastrigin;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f3_Kw,Kwbest3] = myPSOKw(filename,f,xbest_known,xrange);
% rosenbrock
filename    = 'rosenbrock.txt';
f           = @rosenbrock;
xbest_known = [1 1 1];
xrange      = [100, 150, 70];
[mse_f4_Kw,Kwbest4] = myPSOKw(filename,f,xbest_known,xrange);
% branins
% 2-dimensional function, usually evaluated on x1 in [-5,10]; x2 in [0,15]
% it has 3 global minima
filename1    = 'branins1.txt';
filename2    = 'branins2.txt';
filename3    = 'branins3.txt';
f           = @branins;
xbest_known = [-pi, 12.275; pi, 2.275; 9.42478, 2.475];
xrange      = [20,30];
[mse_f51_Kw,Kwbest51] = myPSOKw(filename1,f,xbest_known(1,:),xrange);
[mse_f52_Kw,Kwbest52] = myPSOKw(filename2,f,xbest_known(2,:),xrange);
[mse_f53_Kw,Kwbest53] = myPSOKw(filename3,f,xbest_known(3,:),xrange);


%% test 3
% dejong
filename    = 'dejong.txt';
f           = @dejong;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f1_time,exectime1] = myPSOtime(filename,f,xbest_known,xrange);
% ackley
filename    = 'ackley.txt';
f           = @ackley;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f2_time,exectime2] = myPSOtime(filename,f,xbest_known,xrange);
% rastrigin
filename    = 'rastrigin.txt';
f           = @rastrigin;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f3_time,exectime3] = myPSOtime(filename,f,xbest_known,xrange);
% rosenbrock
filename    = 'rosenbrock.txt';
f           = @rosenbrock;
xbest_known = [1 1 1];
xrange      = [100, 150, 70];
[mse_f4_time,exectime4] = myPSOtime(filename,f,xbest_known,xrange);
% branins
% 2-dimensional function, usually evaluated on x1 in [-5,10]; x2 in [0,15]
% it has 3 global minima
filename1    = 'branins1.txt';
filename2    = 'branins2.txt';
filename3    = 'branins3.txt';
f           = @branins;
xbest_known = [-pi, 12.275; pi, 2.275; 9.42478, 2.475];
xrange      = [20,30];
[mse_f51_time,exectime51] = myPSOtime(filename1,f,xbest_known(1,:),xrange);
[mse_f52_time,exectime52] = myPSOtime(filename2,f,xbest_known(2,:),xrange);
[mse_f53_time,exectime53] = myPSOtime(filename3,f,xbest_known(3,:),xrange);


%% test 4
% dejong
filename    = 'dejong.txt';
f           = @dejong;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f1_p,exectime1] = myPSOplot(filename,f,xbest_known,xrange);
% ackley
filename    = 'ackley.txt';
f           = @ackley;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f2_p,exectime2] = myPSOplot(filename,f,xbest_known,xrange);
% rastrigin
filename    = 'rastrigin.txt';
f           = @rastrigin;
xbest_known = [0 0 0];
xrange      = [100, 150, 70];
[mse_f3_p,exectime3] = myPSOplot(filename,f,xbest_known,xrange);
% rosenbrock
filename    = 'rosenbrock.txt';
f           = @rosenbrock;
xbest_known = [1 1 1];
xrange      = [100, 150, 70];
[mse_f4_p,exectime4] = myPSOplot(filename,f,xbest_known,xrange);
% branins
% 2-dimensional function, usually evaluated on x1 in [-5,10]; x2 in [0,15]
% it has 3 global minima
filename1    = 'branins1.txt';
filename2    = 'branins2.txt';
filename3    = 'branins3.txt';
f           = @branins;
xbest_known = [-pi, 12.275; pi, 2.275; 9.42478, 2.475];
xrange      = [20,30];
[mse_f51_p,exectime51] = myPSOplot(filename1,f,xbest_known(1,:),xrange);
[mse_f52_p,exectime52] = myPSOplot(filename2,f,xbest_known(2,:),xrange);
[mse_f53_p,exectime53] = myPSOplot(filename3,f,xbest_known(3,:),xrange);
