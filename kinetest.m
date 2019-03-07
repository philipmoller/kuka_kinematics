clc;
clear;
close all;
%__________________________________________________________________________________
%i |              alpha    |      a  |      d  |             offset  |
%__|_______________________|_________|_________|_____________________|_____________
L1=Link('alpha',-180*pi/180,'a',  0, 'd', -400,                        'modified');
L2=Link('alpha',90*pi/180,  'a', 25, 'd', 0,                           'modified');
L3=Link('alpha',  0,        'a',315, 'd', 0,    'offset', -90*pi/180,  'modified');
L4=Link('alpha',90*pi/180,  'a',  35,'d', -365,                        'modified');
L5=Link('alpha',-90*pi/180, 'a',  0, 'd', 0,                           'modified');
L6=Link('alpha',90*pi/180,  'a',  0, 'd', 0,    'offset', -180*pi/180, 'modified');

kuka = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'KUKA')
q = [10 20 30 40 50 60]*pi/180;
T06 = kuka.fkine(q)

TWT = [1 0 0  0;
       0 1 0  0;
       0 0 1 80;
       0 0 0  1]

T6W = [1 0  0 0;
       0 -1 0 0;
       0 0 -1 0;
       0 0  0 1]
T0W = T06*T6W*TWT

ZYX = tr2rpy(T0W, 'deg', 'zyx')
