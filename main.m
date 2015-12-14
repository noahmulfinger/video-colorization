close all
clear all
input_dir = 'medium-sample/';
file_ext = 'png';
file_names = dir([input_dir '*.' file_ext]);

num_files = size(file_names, 1);

diffs = zeros(1,num_files);

X = rgb2gray(im2double(imread([input_dir file_names(1).name])));
X = imfilter(X, fspecial('Gaussian', [200 200], 32));
Y = rgb2gray(im2double(imread([input_dir file_names(2).name])));
Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));

x_name = file_names(1).name;
y_name = file_names(2).name;

scene_edges = [x_name ' ' y_name];

for i = 1:(num_files-1)
    value = ssd(X,Y);
    if value < 1000
        diffs(i) = value;
    else
        diffs(i) = value;
        scene_edges = [scene_edges; x_name ' ' y_name];
        
    end
    
    fprintf('ssd for %s and %s is %f.\n',x_name, y_name, diffs(i));

    if (i+1) ~= num_files
        if mod(i,2) == 1
            X = rgb2gray(im2double(imread([input_dir file_names(i+2).name])));
            X = imfilter(X, fspecial('Gaussian', [200 200], 32));
            x_name = file_names(i+2).name;
        else
            Y = rgb2gray(im2double(imread([input_dir file_names(i+2).name])));
            Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));
            y_name = file_names(i+2).name;
        end
    end
end
    
z = 1:num_files;
plot(z, diffs)
% ylim([-1 2])
scene_edges


