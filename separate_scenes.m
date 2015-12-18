function [ scenes, scene_sizes ] = separate_scenes( input_dir, files )

    num_files = size(files, 1);
    
    diffs = zeros(1,num_files);
    
    X = rgb2gray(im2double(imread([input_dir files(1).name])));
    X = imfilter(X, fspecial('Gaussian', [200 200], 32));
    Y = rgb2gray(im2double(imread([input_dir files(2).name])));
    Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));
    
    x_file = files(1);
    y_file = files(2);

%     border_images = [x_name ' ' y_name];
    
    scenes = x_file;
    
    scene_sizes = [];
    
    cutoff = 1000;
    cur_scene = 1;
    add_loc = 1;
    
    
    
    for i = 1:(num_files-1)
        value = ssd(X,Y);
        if value >= cutoff
%             border_images = [border_images; x_name ' ' y_name];
            scenes(add_loc,cur_scene) = x_file;
            scene_sizes(cur_scene) = add_loc;
            add_loc = 1;
            cur_scene = cur_scene + 1;
            scenes(add_loc,cur_scene) = y_file;
            
        else
            scenes(add_loc,cur_scene) = x_file;
            scenes(add_loc+1,cur_scene) = y_file;
            add_loc = add_loc + 2;
            
        end
        diffs(i) = value;


        if (i+1) ~= num_files
            if mod(i,2) == 1
                X = rgb2gray(im2double(imread([input_dir files(i+2).name])));
                X = imfilter(X, fspecial('Gaussian', [200 200], 32));
                x_file = files(i+2);
            else
                Y = rgb2gray(im2double(imread([input_dir files(i+2).name])));
                Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));
                y_file = files(i+2);
            end
        end
    end
    
    scene_sizes(cur_scene) = add_loc - 1;
    
%     z = 1:num_files;
%     plot(z, diffs)
%     line([0 num_files], [cutoff cutoff]);
    
%     scenes

end

