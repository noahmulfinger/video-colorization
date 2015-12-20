function R = colorize_ex(img_col,targets)
    numberOfFiles = numel(targets);
    R = cell(numberOfFiles,1);
    for p = 1:numberOfFiles
        fprintf('   Colorizing %s using %s for color, ', char(targets{p}), img_col);
        colorized = gray2rgb(char(targets{p}), img_col);
        R{p} = colorized;
    end
    
   
		

