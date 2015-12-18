function [ border_images ] = get_border_images( input_dir, file_names )

    num_files = size(file_names, 1);
    diffs = zeros(1,num_files);
    
    X = rgb2gray(im2double(imread([input_dir file_names(1).name])));
    X = imfilter(X, fspecial('Gaussian', [200 200], 32));
    Y = rgb2gray(im2double(imread([input_dir file_names(2).name])));
    Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));


end

