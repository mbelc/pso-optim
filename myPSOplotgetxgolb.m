function [rec_g] = myPSOplotgetxgolb(funchandle, xrange)
% INPUTS:
% xrange    : 1-by-d vector with ranges of each element of an input value
% funchandle: the handle of the function being optimized
%             (e.g., funchandle = @dejong)
% OUTPUTS
% fxbest: best fitness function value
% xbest : associated best value of the input vector x (column vector)
% Note that the internal code should automatically (or deterministically)
% define the encoding for the genotype and termination criteria

% c1: SOCIAL parameter
% c2: COGNITIVE parameter
% K : constriction factor
% w : inertia weight (aka. momentum constant)
% large inertial weight facilitates global exploration
% small inertial weight facilitates local exploitation
global c1 c2 K w;


% STEP 1: generate the initial population in hyperspace
%         where each element in x(i,:) is in [-xrange(d)/2 : xrange(d)/2]
%         i.e. random values distributed over the interval
%         for which the value of fitness function funchandle is calculated
% parameters: dimension of each chromosome x, population size of chomosomes
[~, dim] = size(xrange);
pop_size = 400;
% preallocate space for population array and velocity array
x     = zeros(pop_size,dim);
v     = zeros(pop_size,dim);
% generate initial population
for d = 1:dim
    a = -xrange(d)/2;
    b =  xrange(d)/2;
    % create an array of random floating-point numbers that are drawn from 
    % a uniform distribution in the open interval ] -xrange/2 : xrange/2 [
    x(:,d)       = (b-a).*rand(pop_size,1,'double') + a;
end

% initial population is generated
cur_gen = 1;
% termination criterion: repeat for a number of max_gen generations
max_gen = 100;
% record history
rec_l = zeros(max_gen,2+dim);
rec_g = zeros(max_gen,2+dim);
while cur_gen <= max_gen
    
    % disp('current generation:'); disp(cur_gen);
    
    % STEP 2: Evaluate fitness of individual particles
    %         this is a minimization problem, i.e.
    %         a particle that produces a low fitness value (low funchandle)
    %         has high fitness probability
    % f          = fitness value of the particle
    % funchandle = @dejong for example
    % at the minimum point, the fitness function has a min value
    f = @(z) funchandle(z);
    % LOCAL/ITERATION MINIMUM of the population of particles x
    % i.e. best fitness in CURRENT POPULATION
    f_l = min(f(x));
    % many might have the same min value; pick only one of them
    p_l = x(find(f(x)==f_l,1),:);
    % GLOBAL MINIMUM of the population of particles x
    % i.e. best fitness in ALL POPULATIONS SO FAR
    % For generation 1:
    if cur_gen == 1
        p_g = p_l;
        f_g = f_l;
    % For generation 2 and up:
    elseif min(f(p_l),f(p_g)) == f(p_l)
        p_g = p_l;
        f_g = f_l;
    end
    % record history
    rec_g(cur_gen,:) = [cur_gen, f_g, p_g];
    rec_l(cur_gen,:) = [cur_gen, f_l, p_l];
    
    % STEP 3: Modify velocities	based on local best and global best
    for i=1:pop_size
        for d=1:dim
            v(i,d) = K * ( w * v(i,d) + c1 * rand * (p_l(d) - x(i,d))+ c2 * rand * (p_g(d) - x(i,d)) );
            x(i,d) = x(i,d) + v(i,d);
        end
    end
    % if x value out of range, bring to closest boundary value
    % repeat copies of min array: -xrange/2
    % locate indices where the values is less than min values -xrange/2
    % assign to those values the corresponding min values -xrange/2
    minRange  = repmat(-xrange/2,pop_size,1);
    ind       = x<minRange;
    x(ind)    = minRange(ind);
    % repeat copies of max array: xrange/2
    % locate indices where the values is more than max values xrange/2
    % assign to those values the corresponding max values xrange/2
    maxRange  = repmat(xrange/2,pop_size,1);
    ind       = x>maxRange;
    x(ind)    = maxRange(ind);
    
    % STEP 4: terminate on some condition
    % Here, the generation number is used
    cur_gen = cur_gen+1;
    
end

% most fit particle in x is the last global p_g with fitness f_g
fxbest = f_g;
xbest  = p_g;
