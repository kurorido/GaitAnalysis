function ZCs = findZCs(targetFeature)

% Use L3 acceleration X
% segement_id = 7;
% targetFeature = [];
% for i = start : size(gait.sensorAcceleration, 1)
% 	targetFeature = [targetFeature ; str2num(gait.acceleration{i,segement_id})];
% end

% Filter
% [B,A]= butter(4,15/120,'low');
% targetFeature = filtfilt(B, A, targetFeature);
% clear A B;

zero = 0;

ZCList = [];
first = false;
for i = [2:length(targetFeature)]
	if(~first)
		if(targetFeature(i-1) < zero && targetFeature(i) > zero) % first zero crossing, negative to positive
			first = true;
			ZCList = [ZCList i];
		end
	end

	if(first)
		if(i - ZCList(end) < 10)
			continue;
		end
		if(targetFeature(i-1) > zero && targetFeature(i) < zero) % second zero crossing, positive to negative
			first = false;
			ZCList = [ZCList i];
		end
	end
end

if(mod(length(ZCList),2) ~= 0)
	ZCList = ZCList(1:end-1);
end

TOLERANCE = 5;
merge = true;
while(merge)
	merge = false;
	for i = 1:length(ZCList)/2-1
		a = 2 * i - 1;
		b = 2 * i;
		c = b + 1;
		d = b + 2;
		if ZCList(c) - ZCList(b) < TOLERANCE
			% Combine it
			ZCList = [ZCList(1:a) ZCList(d:end)];
			merge = true;
			break;
		end
	end
end

ZCs = ZCList;

%ZCs = [];
%for i = [1:length(ZCList)/2]
%	a = 2 * i - 1;
%	b = 2 * i;
%	if(trapz(ZCList(a):ZCList(b)-1 , targetFeature(ZCList(a):ZCList(b)-1) > 1.5))
%		ZCs = [ZCs ZCList(a) ZCList(b)];
%	end
%end