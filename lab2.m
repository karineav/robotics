%% Lab 2, Jorge Version

% I know we need to start by calculating lots of stuff, but im gonna write
% this to help

% negative W = turn right

% this function lets us send stuff to the robot
% sp = serial_port_start('COM4'); %com 4 is the left upper most port
% pioneer_init(sp);
v = 50;
w = 0;
derivative_calc_ok = 0;

k1 = 0.0001;
k2 = 0.01;

while(1);
    pause(0.5);
    
    sonars = pioneer_read_sonars()
    
%     f1 = 1.4*sonars(2)-sonars(1);
%     f2 = sonars(1)-900;
%     
%     if((f1 + f2)>0)
%         w = w+1;
%     end
%     if((f1 + f2)<0)
%         w = w-1;
%     end
    
    if (derivative_calc_ok)
        if((sonars(1)-sonars_old(1) < 300) && sonars(1) < 2000)
    w1 = ((sonars(1)-sonars_old(1))*(abs(sonars(1)-600))*k1);
    w2 = (sonars(1)-600)*k2;
    w = int16(w1+w2);
        end
        
        
    end
    
    if(abs(w1) > 10)
        w = int16(w2);
        
    end
    
    sonars_old=sonars;
    if(max(sonars < 250))
        pioneer_set_controls(sp, 0, 0);
        break;
    end
    
    derivative_calc_ok = 1;
    if(w>3)
        w = 3;
    end
    if (w<-3);
        w = -3;
    end
    w
    pioneer_set_controls(sp, v, w);
end

% port, speed, angular velocity
% 
% odometry = pioneer_read_odometry();
% sonars = pioneer_read_sonars();

% serial_port_stop(sp);

% test1 = 550;
% testold1 = 610;
% w1 = (test1-testold1)*(abs(test1-600))*k1
%     w2 = (test1-600)*k2
%     w = int16(w1+w2)