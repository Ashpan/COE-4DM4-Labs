fileID = fopen('my_random_numbers.m','r');
formatSpec = '%f';
sizeA = [1 inf];
rand_nums = fscanf(fileID,formatSpec,sizeA);

A = imread("my_image.jpg");
R_matrix = A(:,:,1); G_matrix = A(:,:,2); B_matrix = A(:,:,3);
[rows,cols,depth] = size(A);
RAND_matrix = zeros(rows,cols,depth);
A_encrypted = zeros(rows,cols,depth);
for i = 1:rows
    for j = 1:cols
        for k = 1:depth
            RAND_matrix(i, j, k) = rand_nums(i+j+k);
            
        end
    end
end

