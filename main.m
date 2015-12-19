close all
clear all
input_dir = 'medium-sample/';
file_ext = 'png';
files = dir([input_dir '*.' file_ext]);



%% Get set of images for each scene (each column is a scene)
[scenes, scene_sizes] = separate_scenes(input_dir, files);

disp('Number of scenes:')
num_scenes = size(scenes, 2)
max_imgs_scene = size(scenes, 1);


%% Get image near center of each scene
images_to_col = [];

for i = 1:num_scenes
%     first_file = scenes(1,i);
%     second_file = scenes(scene_sizes(i),i);
    
    mid_file = scenes(ceil(scene_sizes(i)/2),i);
    images_to_col = [images_to_col; mid_file];
    
end

%% List these scenes as ones that need to be colorized
%List of images to colorize
for file = images_to_col
    fprintf('%s\n', file.name);
end
disp('Colorize the above images in an image editor. Label them <file_name>_scr.png and store in root dir')
pause

%% Colorize each image based on user scribbles, then apply to each scene
for i = 1:size(images_to_col,1)
    img = images_to_col(i).name;
    img_scr = [img(1:end-4) '_scr.png'];
    
%     img = imread([input_dir img]);
%     img_scr = imread(img_scr);
    
    % Colorization by optimization
    img_col = colorize_opt([input_dir img], img_scr);

    
    % Colorization by example
    for j = 1:scene_sizes(i)
        targets{j} = [input_dir scenes(j,i).name];
    end
    
    results = colorize_ex(img_col, targets);
      
end