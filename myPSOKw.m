function [mse_f,Kwbest] = myPSOKw(filename,f,xbest_known,xrange)

% INPUTS:
% xrange     : 1-by-d vector with ranges of each element of an input value
% xbest_known: the known global min for function f
% f          : the function handle of the function being optimized
%             (e.g., f = @dejong)
% filename   : save mse_f to a file named filename (filename = 'dejong.txt')
% OUTPUTS
% mse_f    : array of mean square errors mean[ (f(xbest_known)-fxbest).^2 ]
% Kwbest : associated best value of social and cognitive params. (K,w)
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
K_ = 1:0.5:6;
w_ = 0:0.2:2;
Kw  = (combvec(K_,w_))';
[N,~] = size(Kw);
% phi = c1+c2; % should be > 4
% K   = abs( 2/(2-phi-sqrt(phi^2-4*phi)) );
c1 = 0;
c2 = 0.2;

% number of algorithm runs for function f
runs     = 10;
[~, dim] = size(xrange);
fxbest   = zeros(runs,1);
xbest    = ones(runs,dim);

% replicate the known global min across a number of rows = runs
xbest_f  = repmat(xbest_known,runs,1);
% preallocate space for mse_f
mse_f    = ones(N,1);
for n=1:N
    K = Kw(n,1);
    w = Kw(n,2);
    % perform 10 runs
    for r=1:runs
       [fxbest(r),xbest(r,:)] = myPSO(f, xrange);
    end
    % mean square error
    mse_f(n)  = immse(f(xbest_f),fxbest);
end
% find the K,w resulting in the min mse
Kwbest = Kw(find(mse_f==min(mse_f),1),:);
% Reshape the length(Kw)-by-1 vector into a length(K)-by-length(w) matrix
mse_f    = reshape(mse_f,[length(K_),length(w_)]);
% Save to txt file
dlmwrite(filename,mse_f,'delimiter','\t','precision',3);
