
gait = divideGaitByMarker(gait, 'C:\Users\ErgoLab-MVN\Desktop\SchoolBag\UpOrDownStairs\sb-121002-2T-000-1-001.xlsx')




%----------------------------------------------------------------------L5S1-----------------------------------------
L5S1x=gait.jointAngle(:,1);
L5S1y=gait.jointAngle(:,2);
L5S1z=gait.jointAngle(:,3);




figure
 plot(L5S1x(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L5S1x(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L5S1x(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L5S1x(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L5S1 Lateral bending Right(+)/Lateral bending Left(-)')
axis([-inf,inf,-50,50])



figure
 plot(L5S1y(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L5S1y(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
     plot(L5S1y(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L5S1y(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L5S1 Axial Rotation Left(+)/Axial Rotation Right(-)')
axis([-inf,inf,-50,50])




figure
  plot(L5S1z(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L5S1z(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
     plot(L5S1z(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L5S1z(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L5S1 Flexion(+)/Extension(-)')
axis([-inf,inf,-50,50])



 





%----------------------------------------------------------------------L4L3-----------------------------------------



L4L3x=gait.jointAngle(:,4);
L4L3y=gait.jointAngle(:,5);
L4L3z=gait.jointAngle(:,6);





figure
 plot(L4L3x(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L4L3x(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L4L3x(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L4L3x(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L4L3 Lateral bending Right(+)/Lateral bending Left(-)')
axis([-inf,inf,-10,50])



figure
  plot(L4L3y(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L4L3y(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L4L3y(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L4L3y(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L4L3 Axial Rotation Left(+)/Axial Rotation Right(-)')
axis([-inf,inf,-10,50])




figure
 plot(L4L3z(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L4L3z(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L4L3z(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L4L3z(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
legend('cycle3','cycle4','cycle5')
title('L4L3 Flexion(+)/Extension(-)')
axis([-inf,inf,-10,50])


%------------------------------------------L1T12--------------------------------------------
L1T12x=gait.jointAngle(:,7);
L1T12y=gait.jointAngle(:,8);
L1T12z=gait.jointAngle(:,9);

figure
 plot(L1T12x(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L1T12x(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L1T12x(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L1T12x(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L1T12 Lateral bending Right(+)/Lateral bending Left(-)')
axis([-inf,inf,-10,50])



figure
 plot(L1T12y(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L1T12y(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L1T12y(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L1T12y(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L1T12 Axial Rotation Left(+)/Axial Rotation Right(-)')
axis([-inf,inf,-10,50])




figure
  plot(L1T12z(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(L1T12z(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(L1T12z(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(L1T12z(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('L1T12 Flexion(+)/Extension(-)')
axis([-inf,inf,-10,50])


%--------------------------------------------T9T8--------------------------------

T9T8x=gait.jointAngle(:,10);
T9T8y=gait.jointAngle(:,11);
T9T8z=gait.jointAngle(:,12);


figure
 plot(T9T8x(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T9T8x(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T9T8x(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T9T8x(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T9T8 Lateral bending Right(+)/Lateral bending Left(-)')
axis([-inf,inf,-10,50])



figure
  plot(T9T8y(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T9T8y(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T9T8y(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T9T8y(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T9T8 Axial Rotation Left(+)/Axial Rotation Right(-)')
axis([-inf,inf,-10,50])




figure
  plot(T9T8z(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T9T8z(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T9T8z(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T9T8z(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T9T8 Flexion(+)/Extension(-)')
axis([-inf,inf,-10,50])


%--------------------------------------------------------------T1C7-----------------------




T1C7x=gait.jointAngle(:,13);
T1C7y=gait.jointAngle(:,14);
T1C7z=gait.jointAngle(:,15);


figure
 plot(T1C7x(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T1C7x(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T1C7x(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T1C7x(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T1C7 Lateral bending Right(+)/Lateral bending Left(-)')
axis([-inf,inf,-10,50])



figure
 plot(T1C7y(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T1C7y(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T1C7y(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T1C7y(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T1C7 Axial Rotation Left(+)/Axial Rotation Right(-)')
axis([-inf,inf,-10,50])




figure
 plot(T1C7z(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(T1C7z(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(T1C7z(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(T1C7z(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('T1C7 Flexion(+)/Extension(-)')
axis([-inf,inf,-10,50])

%-------------------------------------------RightC7Shoulder---------------------------------------




RightC7Shoulderx=gait.jointAngle(:,19);
RightC7Shouldery=gait.jointAngle(:,20);
RightC7Shoulderz=gait.jointAngle(:,21);

figure
  plot(RightC7Shoulderx(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightC7Shoulderx(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightC7Shoulderx(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightC7Shoulderx(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('RightC7Shoulder Abduction (+)/Adduction bending Left(-)')
axis([-inf,inf,-40,50])



figure
plot(RightC7Shouldery(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightC7Shouldery(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightC7Shouldery(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightC7Shouldery(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('RightC7Shoulder Internal Rotation(+)/External Rotation(-)')
axis([-inf,inf,-40,50])




figure
 plot(RightC7Shoulderz(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightC7Shoulderz(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightC7Shoulderz(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightC7Shoulderz(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('RightC7Shoulder Flexion(+)/Extension(-)')
axis([-inf,inf,-40,50])


%----------------------------------------------RightShoulder------------------------------

RightShoulderx=gait.jointAngle(:,22);
RightShouldery=gait.jointAngle(:,23);
RightShoulderz=gait.jointAngle(:,24);


figure
plot(RightShoulderx(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightShoulderx(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightShoulderx(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightShoulderx(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('RightShoulder Abduction (+)/Adduction bending Left(-)')
axis([-inf,inf,-40,50])



figure
 plot(RightShouldery(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightShouldery(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightShouldery(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightShouldery(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')

title('RightShoulder Internal Rotation(+)/External Rotation(-)')
axis([-inf,inf,-40,50])




figure
 plot(RightShoulderz(gait. RightInitialContact(2):gait. RightInitialContact(3)),'r')
 hold on
  plot(RightShoulderz(gait. RightInitialContact(3):gait. RightInitialContact(4)),'b')
    plot(RightShoulderz(gait. RightInitialContact(6):gait. RightInitialContact(7)),'g')
      plot(RightShoulderz(gait. RightInitialContact(7):gait. RightInitialContact(8)),'y')
 legend('cycle3','cycle4','cycle7','cycle8')
title('RightShoulder Flexion(+)/Extension(-)')
axis([-inf,inf,-40,50])

