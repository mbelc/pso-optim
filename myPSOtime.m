function [mse_f,exectime] = myPSOtime(filename,f,xbest_known,xrange)

% INPUTS:
% xrange     : 1-by-d vector with ranges of each element of an input value
% xbest_known: the known global min for function f
% f          : the function handle of the function being optimized
%             (e.g., f = @dejong)
% filename   : save mse_f to a file named filename (filename = 'dejong.txt')
% OUTPUTS
% mse_f    : array of mean square errors mean[ (f(xbest_known)-fxbest).^2 ]
% c1c2best : associated best value of social and cognitive params. (c1,c2)
% INFORMATION
% Dejong, Ackley, Rastrigin, Rosenbrock, the following xrange is used:
% xrange   = [100, 150, 70];
% Branins is a 2-dimensional function, the following xrange is used:
% usually evaluated on x1 in [-5,10] and x2 in [0,15]
% xrange   = [20,30];
% Dejong, Ackley, Rastrigin, known global min is at xbest_known = [0,0,...,0]
% Rosenbrock, known global min is at xbest_known = [1,1,...,1]
% Branins, 3 known global mins are:
% xbest_known = (-pi, 12.275), (pi, 2.275), and (9.42478, 2.475)

global c1 c2 K w;
% specify values for c1,c2,K,w
C1 = [0.0 0.0 0.0 0.2 0.2 0.2 0.4 0.4 0.4 0.0]';
C2 = [0.2 0.4 0.6 0.2 0.6 0.8 0.2 0.4 0.6 0.4]';
K_ = [4.0 1.0 1.0 1.0 1.0 1.5 1.5 2.0 2.0 4.5]';
w_ = [0.2 0.2 0.4 0.6 0.8 0.2 0.6 0.2 0.4 0.2]';
[N,~] = size(C1); % == size(C2) == size(K_) == size(w_)

% number of algorithm runs for function f
runs     = 10;
[~, dim] = size(xrange);
fxbest   = zeros(runs,1);
xbest    = ones(runs,dim);

% replicate the known global min across a number of rows = runs
xbest_f  = repmat(xbest_known,runs,1);
% preallocate space for mse_f and exec_time
mse_f     = ones(N,1);
exectime  = ones(N,1);
for n=1:N
    c1 = C1(n);
    c2 = C2(n);
    K  = K_(n);
    w  = w_(n);
    % perform 10 runs
    tic;
    for r=1:runs
       [fxbest(r),xbest(r,:)] = myPSO(f, xrange);
    end
    exectime(n)=toc;
    % mean square error
    mse_f(n)  = immse(f(xbest_f),fxbest);
end
% Save to txt file
matr = [mse_f exectime];
dlmwrite(filename,matr,'delimiter','\t','precision',3);
