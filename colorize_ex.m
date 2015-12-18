function R = colorize_ex(reference,targets)
    numberOfFiles = numel(targets);
    R = cell(numberOfFiles,1);
    for p = 1:numberOfFiles
        colorized = gray2rgb(reference,targets{p});
        R{p} = colorized;
    end
		

