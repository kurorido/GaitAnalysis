ic_time = load(strcat(DATA_DIR, '\ic_time.txt'));

START_TIME = ic_time(5);
END_TIME = ic_time(8);

vector = gait.centerOfMass(START_TIME:END_TIME, 1);
s = vector(1);
e = vector(end);
speed = abs(e - s) / ((END_TIME - START_TIME + 1) * 0.008);