function [] = aerodynamics_plots_calculations(t,z,Ma,Fa,nfig)
%%
% alplots of Ma and Fa                             Approach & Landing Plots
% -------------------------------------------------------------------------
%
% After approach & landing simulation is performed with ALS1 or ALS2:
%   [t,~,z]=sim('ALS1');
%   [t,~,z]=sim('ALS2');
% this routine plots the main results on two figures.
%
% CALLS 
% -----
% alplots(t,z)
% alplots(t,z,nfig)
%
% INPUT ARGUMENTS
% ---------------
% t  N-by-1 time history vector
% Ma  N-by-3 simulation outputs vector
% Fa  N-by-3 simulation outputs vector
%
% -------------------------------------------------------------------------
% Adapted from SMAC Toolbox ONERA The French Aerospace Lab, Toulouse, France
% Multi-Objective Landing Aircraft Benchmark.
% Author: J-M. Biannic, Rui
% Last revision: February 2023 by Rui
% -------------------------------------------------------------------------
global ACSP
tmax=max(t);

if nargin<3
    figure; clf; 
else
    figure(nfig); clf;
end;

subplot(321); plot(t,Fa(:,1)); 
xlabel('Time (sec)'); ylabel('Fa_x'); grid;
axis([0 tmax min(Fa(:,1)-1) max(Fa(:,1))+1]);

% subplot(322); plot(t,Ma(:,1)); 
% xlabel('Time (sec)'); ylabel('Ma_x'); grid;
% axis([0 tmax min(Ma(:,1))-0.5 max(Ma(:,1))+0.5]);

subplot(323); plot(t,Fa(:,2)); 
xlabel('Time (sec)'); ylabel('Fa_y'); grid;
axis([0 tmax min(Fa(:,2))-1 max(Fa(:,2))+1]);

% subplot(324); plot(t,Ma(:,2)); 
% xlabel('Time (sec)'); ylabel('Ma_y'); grid;
% axis([0 tmax min(Ma(:,2))-1 max(Ma(:,2))+1]);

subplot(325); plot(t,Fa(:,3)); 
xlabel('Time (sec)'); ylabel('Fa_z'); grid;
axis([0 tmax min(Fa(:,3))-1 max(Fa(:,3))+1]);


% subplot(326); plot(t,Ma(:,3)); 
% xlabel('Time (sec)'); ylabel('Ma_z'); grid;
% axis([0 tmax min(Ma(:,3))-1 max(Ma(:,3))+1]);

subplot(321);
title('               Aeroforces and moments',...
    'FontSize',13);

% %%plot correlation between outputs and aerodynamics
% if nargin<3
%     figure; clf; 
% else
%     figure(nfig+1); clf;
% end;
% 
% subplot(321); 
% plot(z(:, 11),Fa(:, 1));
% xlabel('Vc'); ylabel('Fa_x'); grid;
% axis([0 tmax min(Fa(:,1)-1) max(Fa(:,1))+1]);
% 
% subplot(322); 
% plot(z(:, 11),Ma(:, 1));
% xlabel('Vc'); ylabel('Ma_x'); grid;
% axis([0 tmax min(Ma(:,1)-1) max(Ma(:,1))+1]);
% 
% subplot(323); 
% plot(z(:, 11),Fa(:, 2));
% xlabel('Vc'); ylabel('Fa_y'); grid;
% axis([0 tmax min(Fa(:,2)-1) max(Fa(:,2))+1]);
% 
% subplot(324); 
% plot(z(:, 11),Ma(:, 2));
% xlabel('Vc'); ylabel('Ma_y'); grid;
% axis([0 tmax min(Ma(:,2)-1) max(Ma(:,2))+1]);
% 
% subplot(325); 
% plot(z(:, 11),Fa(:, 3));
% xlabel('Vc'); ylabel('Fa_z'); grid;
% axis([0 tmax min(Fa(:,3)-1) max(Fa(:,3))+1]);
% 
% subplot(326); 
% plot(z(:, 11),Ma(:, 3));
% xlabel('Vc'); ylabel('Ma_z'); grid;
% axis([0 tmax min(Ma(:,3)-1) max(Ma(:,3))+1]);
% 
% subplot(321);
% title('               Vc and Aerodynamics',...
%     'FontSize',13);
% 
% if nargin<3
%     figure; clf; 
% else
%     figure(nfig+2); clf;
% end;
% 
% subplot(321); 
% plot(z(:, 12),Fa(:, 1));
% xlabel('Va'); ylabel('Fa_x'); grid;
% axis([0 tmax min(Fa(:,1)-1) max(Fa(:,1))+1]);
% 
% subplot(322); 
% plot(z(:, 12),Ma(:, 1));
% xlabel('Va'); ylabel('Ma_x'); grid;
% axis([0 tmax min(Ma(:,1)-1) max(Ma(:,1))+1]);
% 
% subplot(323); 
% plot(z(:, 12),Fa(:, 2));
% xlabel('Va'); ylabel('Fa_y'); grid;
% axis([0 tmax min(Fa(:,2)-1) max(Fa(:,2))+1]);
% 
% subplot(324); 
% plot(z(:, 12),Ma(:, 2));
% xlabel('Va'); ylabel('Ma_y'); grid;
% axis([0 tmax min(Ma(:,2)-1) max(Ma(:,2))+1]);
% 
% subplot(325); 
% plot(z(:, 12),Fa(:, 3));
% xlabel('Va'); ylabel('Fa_z'); grid;
% axis([0 tmax min(Fa(:,3)-1) max(Fa(:,3))+1]);
% 
% subplot(326); 
% plot(z(:, 12),Ma(:, 3));
% xlabel('Va'); ylabel('Ma_z'); grid;
% axis([0 tmax min(Ma(:,3)-1) max(Ma(:,3))+1]);
% 
% subplot(321);
% title('               Va and Aerodynamics',...
%     'FontSize',13);