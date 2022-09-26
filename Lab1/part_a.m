clear;

clc

S = zeros(1, 22);

S(1,1) = 1;

DATA_OUT = zeros(1, 2^16);
next_num = 1;

S_initial = S;

found_period = 0;
period = 0;
disp(S)
for time=1:5000000
    ls_bit = S(1,1);
    ms_bit = S(1, 22);

    S(1, 22) = S(1, 1);
    S(1,1:20) = S(1,2:21);
    S(1, 21) = xor(ls_bit, ms_bit);
    
    DATA_OUT(1,next_num) = ls_bit;
    next_num = next_num + 1;

    fprintf("here is the state-vector at time %g\n", time);
    fprintf("%g, ", S);
    fprintf("\n\n");

    if (S == S_initial)
        fprintf("The state at time %g == the initial state; we are done\n", time);
        found_period = 1;
        period = time;
        break;
    end
end

if (found_period == 1)
    fprintf("\nFound period = %g clock ticks, here are the random bits\n", period);
    fprintf("%g, ", DATA_OUT(1,1:period));
    fprintf("\n\n");
    
    fprintf("Here is a decimal representation\n");
    num_bytes = floor(period/8);
    
    for j=1:num_bytes
        start_index = (j-1)*8+1;
        end_index = start_index+8-1;
        
        BITS = DATA_OUT(1,start_index:end_index);
        
        integer = bits2num(BITS);
        fprintf("%g, ", integer);
    end
    fprintf("\n")
    
else
   fprintf("DID NOT FIND PERIOD! \n"); 
end
