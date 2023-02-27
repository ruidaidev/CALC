%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Contributor: Rui Dai                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Aircraft Open-loop EVALUATION                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

addpath("L-GP Solver")

plotInput=false;

global ACSP;                      % define ACSP as a global variable

clear flightpar
flightpar.MASS=150;
flightpar.XCG=21;
flightpar.VC=2.572+0.5144*max(119*sqrt(flightpar.MASS/140),118);
flightpar.WX=0;
flightpar.altRWY=0;
flightpar.gamRWY=0;
flightpar.T0=15;
flightpar.Z=300;
flightpar.gamK=-3;
flightpar.gamGLD=-3;
flightpar.dZ=-30;
flightpar.dY=50;

%define the inputs
t=0.05:0.05:50;
t=t';

if plotInput
    % plot correlation with delta_a
    for i=-55:3.6:55
        u=zeros(1,9);
        u(1)=1; %epr
        u(2)=i; %delta_a
        u(5)=10;
        u=repmat(u, 1000, 1);
        % ACStrim(flightpar);               % trim and store results in ACSP 
        [sys,x0,y0]=ACStrim(flightpar);
        
        % [t, x, y]=sim('ACS', 'debug', 'on');
        sim('ACS_maunal_test.slx');
        plot_correlations(u(1,:), yout, 'delta_a', 1)
    end
    
    % plot correlation with delta_e
    for i=-25:1.4:25
        u=zeros(1,9);
        u(1)=1; %epr
        u(3)=i; %delta_a
        u(5)=10;
        u=repmat(u, 1000, 1);
        % ACStrim(flightpar);               % trim and store results in ACSP 
        [sys,x0,y0]=ACStrim(flightpar);
        
        % [t, x, y]=sim('ACS', 'debug', 'on');
        sim('ACS_maunal_test.slx');
        plot_correlations(u(1,:), yout, 'delta_e', 2)
    end
    
    % plot correlation with delta_a
    for i=-30:6:30
        u=zeros(1,9);
        u(1)=1; %epr
        u(4)=i; %delta_a
        u(5)=10;
        u=repmat(u, 1000, 1);
        % ACStrim(flightpar);               % trim and store results in ACSP 
        [sys,x0,y0]=ACStrim(flightpar);
        
        % [t, x, y]=sim('ACS', 'debug', 'on');
        sim('ACS_maunal_test.slx');
        plot_correlations(u(1,:), yout, 'delta_r', 3)
    end

else
    % plot correlation of measured output to aerodynamic force
    for delta_a=-55:3.6:55
        for delta_e=-25:1.4:25
            for delta_r=-30:6:30
                u=zeros(1,9);
                u(1)=1; %epr
                u(2)=delta_a; %delta_a
                u(3)=delta_e;
                u(4)=delta_r;
                u(5)=10;
                u(6)=10;
                u(7)=10;
                u=repmat(u, 1000, 1);
                % ACStrim(flightpar);               % trim and store results in ACSP 
                [sys,x0,y0]=ACStrim(flightpar);
                
                % [t, x, y]=sim('ACS', 'debug', 'on');
                sim('ACS_maunal_test.slx');
                plot_correlations_aeroforce(u(1,:), yout)
            end
        end
    end
end