%% Lab 2, Jorge Version

% I know we need to start by calculating lots of stuff, but im gonna write
% this to help

% negative W = turn right

% this function lets us send stuff to the robot
% sp = serial_port_start('COM4'); %com 4 is the left upper most port
% pioneer_init(sp);
speed_factor = 1;
speed = 50; %was 50
w = 0;


w_cap = 3; %was 5
v=speed;

v=v*speed_factor;
w_cap = w_cap*speed_factor; 
% sonars_old = sonars;
while(1);
%     pause(0.3);
    sonars = pioneer_read_sonars()

    
    if(max(sonars < 200))
        v=0;
        i=0;
    end
    %If he detects no obstacles for 3*0.3seconds = 0.9 seconds
    %He starts moving again
    if(i == 3)
        v=speed;
    end
    
    w = w + VoiceRecog(0.3)*speed_factor;
    
    if(w>w_cap)
        w = w_cap;
    end
    if (w<-w_cap);
        w = -w_cap;
    end
    w
    pioneer_set_controls(sp, v, w);
    i=i+1;

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