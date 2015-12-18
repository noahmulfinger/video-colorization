function [ scenes ] = separate_scenes( input_dir, file_names )

    num_files = size(file_names, 1);
    
    diffs = zeros(1,num_files);
    
    X = rgb2gray(im2double(imread([input_dir file_names(1).name])));
    X = imfilter(X, fspecial('Gaussian', [200 200], 32));
    Y = rgb2gray(im2double(imread([input_dir file_names(2).name])));
    Y = imfilter(Y, fspecial('Gaussian', [200 200], 32));
    
    x_name = file_names(1).name;
    y_name = file_names(2).name;

%     border_images = [x_name ' ' y_name];
    
    scenes = [{''}];
    
    cutoff = 1000;
    cur_scene = 1;
    add_loc = 1;
    
    
    for i = 1:(num_files-1)
        value = ssd(X,Y);
        if value >= cutoff
%             border_images = [border_images; x_name ' ' y_name];
            scenes(add_loc,cur_scene) = {x_name};
            add_loc = 1;
            cur_scene = cur_scene + 1;
            scenes(add_loc,cur_scene) = {y_name};
            
        else
            scenes(add_loc,cur_scene) = {x_name};
            scenes(add_loc+1,cur_scene) = {y_name};
            add_loc = add_loc + 2;
            
        end
        diffs(i) = value;


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
    
%     z = 1:num_files;
%     plot(z, diffs)
%     line([0 num_files], [cutoff cutoff]);
    
%     scenes

end

