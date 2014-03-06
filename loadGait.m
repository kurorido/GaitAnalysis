function gait = loadGait(MVN_FILE_NAME)

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

% Go through all frame
currentFrame = 0;
frameNode = framesNode.getFirstChild();
for i = 1 : framesNode.getChildNodes().getLength()
	if(frameNode.getNodeType() == 1) % only element node
		node = frameNode.getFirstChild();
		
		%attrs = node.getAttributes();
		%timeNode = attrs.getNamedItem('time');
		%time = timeNode.getNodeValue();
		if(frameNode.getNodeName() == 'frame') % a frame
		
			currentFrame = currentFrame + 1;
			
			if(currentFrame > 2)
				for j = 1 : frameNode.getChildNodes().getLength() % go through frame's children
					content = char(node.getTextContent());
					result = textscan(content, '%s');
					if(node.getNodeName() == 'sensorAcceleration')
						gait.sensorAcceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'acceleration')
						gait.acceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'jointAngle')
						gait.jointAngle(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'angularVelocity')
						gait.angularVelocity(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'angularAcceleration')
						gait.angularAcceleration(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'velocity')
						gait.velocity(currentFrame-2, :) = result{1};
					elseif(node.getNodeName() == 'sensorAngularVelocity')
						gait.sensorAngularVelocity(currentFrame-2, :) = result{1};
					end
					node = node.getNextSibling(); % next attribute
				end
			end
		end
	end
	frameNode = frameNode.getNextSibling(); % next frame
end