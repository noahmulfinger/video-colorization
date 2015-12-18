close all
clear all
input_dir = 'medium-sample/';
file_ext = 'png';
file_names = dir([input_dir '*.' file_ext]);



%% Get set of images for each scene (each column is a scene)
scenes = separate_scenes(input_dir, file_names);

disp('Number of scenes:')
num_scenes = size(scenes, 2)
max_imgs_scene = size(scenes, 1);


%% Get image in center of each scene
images_col = [];

for i = 1:num_scenes
    first_image = scenes(1,i);
    second_image = scenes(1,i);
    k = strfind(char(second_image), '.png');
    
    counter = 1;
    while ~isempty(second_image{1}) && counter < max_imgs_scene
        counter = counter + 1;
        second_image = scenes(counter,i);
    end
    second_image = scenes(counter-1,i);
    
    first_image = char(first_image);
    first_val = str2num(first_image(1:end-4));
    second_image = char(second_image);
    second_val = str2num(second_image(1:end-4));
    
    mid_val = floor(first_val + (second_val - first_val) / 2);
    img = ['0000' num2str(mid_val) '.png'];
    images_col = [images_col; img];
    
    
end

%% List these scenes as ones that need to be colorized
%List of images to colorize
images_col
disp('Colorize the above images in an image editor. Label them <file_name>_scr.png and store in root dir')
pause

%% Colorize each image based on user scribbles, then apply to each scene
for i = 1:size(images_col,1)
    img = images_col(i,:);
    img_scr = [img(1:end-4) '_scr.png'];
    
    img = imread(img);
    img_scr = imread(img_col);
    
    img_col = colorizeFun(img, img_scr);
    
    % Do colorization by example for each scene using img_col as example
    for j = scenes(:,i)

    end
end