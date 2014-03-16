function ZCs = findZCs(gait, start)

% Use L3 acceleration X
segement_id = 7;
accL3_Z = [];
for i = start : size(gait.sensorAcceleration, 1)
	accL3_Z = [accL3_Z ; str2num(gait.acceleration{i,segement_id})];
end

% Filter
[B,A]= butter(4,15/120,'low');
accL3_Z = filtfilt(B, A, accL3_Z);
clear A B;

% find validate ZC
ZCList = [];
first = false;
for i = [2:length(accL3_Z)]
	if(~first)
		if(accL3_Z(i-1) < 0 && accL3_Z(i) > 0) % first zero crossing, negative to positive
			first = true;
			ZCList = [ZCList i];
		end
	end

	if(first)
		if(i - ZCList(end) < 10)
			continue;
		end
		if(accL3_Z(i-1) > 0 && accL3_Z(i) < 0) % second zero crossing, positive to negative
			first = false;
			ZCList = [ZCList i];
		end
	end
end

if(mod(length(ZCList),2) ~= 0)
	ZCList = ZCList(1:end-1);
end

ZCs = ZCList + start;

%ZCs = [];
%for i = [1:length(ZCList)/2]
%	a = 2 * i - 1;
%	b = 2 * i;
%	if(trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1) > 1.5))
%		ZCs = [ZCs ZCList(a) ZCList(b)];
%	end
%end