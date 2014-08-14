function gait = loadGait(MVN_FILE_NAME)

% MVN_FILE_NAME = 'C:\Users\Ergolab2\Desktop\Roliroli\MVN\Export\20140116\20140116-011_Suit 00131162.mvnx'
% MVN_FILE_NAME = 'C:\Users\ErgoLab-MVN\Desktop\demo\sb-111001-2T-000-2-002.mvnx'

xDoc = xmlread(MVN_FILE_NAME);
xRoot = xDoc.getDocumentElement;

% Find subject node
subjectNode = xRoot.getFirstChild();
for i = 1 : xRoot.getChildNodes().getLength()
	
	if(subjectNode.getNodeName() == 'subject')
		break;
	else
		subjectNode = subjectNode.getNextSibling();
	end

end

% Parse subject node

% find frames node
framesNode = subjectNode.getFirstChild();
for i = 1 : subjectNode.getChildNodes().getLength()
	
	if(framesNode.getNodeName() == 'frames')
		break;
	else
		framesNode = framesNode.getNextSibling();
	end

end

% Frame Count
frameCount = 0;
tmp_frameNode = framesNode.getFirstChild();
for i = 1 : framesNode.getChildNodes().getLength()
	if(tmp_frameNode.getNodeType() == 1) % only element node
		frameCount = frameCount + 1;
	end
	tmp_frameNode = tmp_frameNode.getNextSibling(); % next frame
end

% Initialize Array for speed
%gait.sensorAcceleration = zeros(frameCount, 21);
%gait.sensorAngularVelocity = zeros(frameCount, 21);
%gait.acceleration = zeros(frameCount, 69);
%gait.angularVelocity = zeros(frameCount, 69);
%gait.angularAcceleration = zeros(frameCount, 69);

% For marker
gait.marker = [];

% Go through all frame
currentFrame = 0;
frameNode = framesNode.getFirstChild();
for i = 1 : framesNode.getChildNodes().getLength()
	if(frameNode.getNodeType() == 1) % only element node
		
		node = frameNode.getFirstChild();

		if(frameNode.getNodeName() == 'frame') % a frame

			currentFrame = currentFrame + 1;
			
			if(currentFrame > 2)
				for j = 1 : frameNode.getChildNodes().getLength() % go through frame's children
					content = char(node.getTextContent());
					result = textscan(content, '%f');
					if(node.getNodeName() == 'sensorAcceleration') % 1
						gait.sensorAcceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'acceleration') % 2
						gait.acceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'jointAngle')
						gait.jointAngle(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'angularVelocity') % 3
						gait.angularVelocity(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'angularAcceleration') % 4
						gait.angularAcceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'velocity')
						gait.velocity(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'sensorAngularVelocity') % 5
						gait.sensorAngularVelocity(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'centerOfMass')
						gait.centerOfMass(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'jointAngleXZY')
						gait.jointAngleXZY(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'position')
						gait.position(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'marker')
						% Parse index only when need
						index = str2double(cell(frameNode.getAttributes().getNamedItem('index').getValue()));
						gait.marker = [gait.marker index];
					end
					node = node.getNextSibling(); % next attribute
					
				end
			end
		end
	end
	frameNode = frameNode.getNextSibling(); % next frame
end