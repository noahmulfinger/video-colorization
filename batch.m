function R=batch(reference,targets)
	numberOfFiles = numel(targets)
	R = cell(numberOfFiles,1)
	for p = 1 : numberOfFiles
		colorized = gray2rgb(reference,targets{p});
		r{p} = colorized
