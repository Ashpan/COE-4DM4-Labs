clear; clc;

%Reading DATA_OUT from the my_random_numbers.m file into rand_nums array
fileID = fopen('my_random_numbers.m','r');
formatSpec = '%f';
sizeA = [1 inf];
rand_nums = fscanf(fileID,formatSpec,sizeA);

%Opening the input image and converting it to a 3D array of pixels named A
A = imread("my_image_2.jpg");
image(uint8(A));
pause;
R_matrix = A(:,:,1); G_matrix = A(:,:,2); B_matrix = A(:,:,3);

%Initializing the RAND_matrix and A_encrypted arrays
[rows,cols,depth] = size(A);
RAND_matrix = zeros(rows,cols,depth);
A_encrypted = zeros(rows,cols,depth);

%Encrypting the image
%Iterating through the RAND_matrix and storing a value of rand_nums
%XORing the current indexed value of RAND_matrix and A, into A_encrypted
c = 1;
for i = 1:rows
    for j = 1:cols
        for k = 1:depth
            if c == (width(rand_nums))
                c = 1;
            else
                c = c + 1;
            end
            RAND_matrix(i, j, k) = rand_nums(c);
            A_encrypted(i, j, k) = uint8(bitxor(A(i,j,k), RAND_matrix(i,j,k)));
        end
    end
end

%Displaying the encrypted image
image(uint8(A_encrypted));
pause;

%Initializing A_decrypted array
A_decrypted = zeros(rows,cols,depth);

%Using the same steps as to encrypt, the image is decrypted
c = 1;
for i = 1:rows
    for j = 1:cols
        for k = 1:depth
            if c == (width(rand_nums))
                c = 1;
            else
                c = c + 1;
            end
            RAND_matrix(i, j, k) = rand_nums(c);
            A_decrypted(i, j, k) = uint8(bitxor(A_encrypted(i,j,k), RAND_matrix(i,j,k)));
        end
    end
end

%Displaying the decrypted image
image(uint8(A_decrypted))