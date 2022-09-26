function num = bits2num (BITS)

[row, cols] = size(BITS);

num = 0;
for j=1:cols
    if(BITS(1,j) == 1)
        num = num + 2^(j-1);
    end
end

end