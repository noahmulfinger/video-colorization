close all
clear all
input_dir = 'medium-sample/';
file_ext = 'png';
files = dir([input_dir '*.' file_ext]);



%% Get set of images for each scene (each column is a scene)
[scenes, scene_sizes] = separate_scenes(input_dir, files);
scene_sizes
disp('Number of scenes:')
num_scenes = size(scenes, 2)
max_imgs_scene = size(scenes, 1);


%% Get image near center of each scene
images_to_col = [];

for i = 1:num_scenes
   
    mid_file = scenes(ceil(scene_sizes(i)/2),i);
    images_to_col = [images_to_col; mid_file];
    
end

%% List these scenes as ones that need to be colorized
%List of images to colorize
for file = images_to_col
    fprintf('%s\n', file.name);
end
disp('Colorize the above images in an image editor them <file_name>_scr.png and store in root dir, then press ENTER')
pause

%% Colorize each image based on user scribbles, then apply to each scene

images_to_col = [ '00002143.png';
    '00002192.png';
    '00002212.png';
    '00002232.png';
    '00002316.png';
    '00002399.png';
    '00002401.png';
    '00002427.png';
    '00002453.png';
    '00002454.png';
    '00002519.png';
    '00002624.png';
    '00002665.png';
    '00002707.png';
    '00002853.png';
    '00002958.png';
    '00002969.png'];
                  


for i = 1:size(images_to_col,1)
    img = images_to_col(i,:);
    img_scr = [img(1:end-4) '_scr.png'];
    
%     img = imread([input_dir img]);
%     img_scr = imread(img_scr);
    
    % Colorization by optimization
    
    img_col = colorize_opt(input_dir, img, img_scr);
    fprintf('Colorized by opt: %s to get %s\n', img, img_col);

    
    % Colorization by example
    targets = {''};
    for j = 1:scene_sizes(i)
        targets{j} = [input_dir scenes(j,i).name];
    end
    results = colorize_ex(img_col, targets);
      
end
