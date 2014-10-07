function newIC = stableIC(IC)

	newIC = [0 IC];
	IC = [IC 0];
	
	diffs = newIC - IC;
	
	inds = find(diffs < 200);
	ind = inds(2);
	newIC = IC(ind:end-1);

end