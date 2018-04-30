%% Lab 2, Jorge Version

% I know we need to start by calculating lots of stuff, but im gonna write
% this to help

% negative W = turn right

% this function lets us send stuff to the robot
% sp = serial_port_start('COM4'); %com 4 is the left upper most port
% pioneer_init(sp);
v = 50;
w = 0;

% sonars_old = sonars;
while(1);
%     pause(0.3);
    
    sonars = pioneer_read_sonars()

    
    if(max(sonars < 250))
        pioneer_set_controls(sp, 0, 0);
        break;
    end
    
    w = w + VoiceRecog(0.3);
    
    if(w>5)
        w = 5;
    end
    if (w<-5);
        w = -5;
    end
    w
    pioneer_set_controls(sp, v, w);

end

% port, speed, angular velocity
% 
% odometry = pioneer_read_odometry();
% sonars = pioneer_read_sonars();

% serial_port_stop(sp);

% test1 = 200;
% testold1 = 700;
% w1 = (test1-testold1)*(abs(test1-600))*k1
%     w2 = (test1-600)*k2
%     w = int16(w1+w2)