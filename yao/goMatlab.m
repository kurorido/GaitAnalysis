FILENAME = 'J:\YAO''s DATA\SchoolBag DATAbase\@MVN-3_part_MVNX\#L\sb-111001-1L\sb-111001-1L-000-1.mvnx';
OUTFILENAME = 'sb-111001-1L-000-1';

gait = loadGait(FILENAME);
save(OUTFILENAME, 'gait');

clear gait;