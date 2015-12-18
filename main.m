close all
clear all
input_dir = 'medium-sample/';
file_ext = 'png';
file_names = dir([input_dir '*.' file_ext]);

scenes = separate_scenes(input_dir, file_names);




% border_images = zeros(7,2);


% Get set of images for each scene
% num_scenes = size(border_images, 1);
% scenes = [];
% 
% edge = '00001945.png';
% cur_scene = 1;
% add_loc_1 = 1;
% add_loc_2 = 1;
% for file = file_names'
%     if str2num(file.name(1:end-4)) < str2num(test(1:end-4))
%         scenes(add_loc_1,1) = file.name;
%         add_loc_1 = add_loc_1 + 1;
%     else
%         scenes(add_loc_2,2) = file.name;
%         add_loc_2 = add_loc_2 + 1;
%     end
%     
% end
% 
% scenes

% Get image in center of each scene

% List these scenes as ones that need to be colorized

% User does scribbling on images

% Use these images to colorize whole scene