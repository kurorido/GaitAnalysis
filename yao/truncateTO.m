function newTO = truncateTO(IC, TO)
	
	standard = IC(1);
	diffs = TO - standard;
	ind = find(diffs > 0);
	ind = ind(1);
	newTO = TO(ind:end);

end