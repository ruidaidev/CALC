function [Fa,Ma] = aero_calculation(z, ACSP)

Fa = zeros(length(z), 3);
Ma = zeros(length(z), 3);

delta0 = ACSP.U0.delta; % what this delta0 refers to

% Fa
L = 7.5;
S = 360;
CL0 = 0.90;
CLalpha = 5.5;
CLq = 3.3;
CL_delta_e = 0.32;
CLH = 0.20;
lambda_L = 0.12;
CYbeta = -0.7;
CY_delta_r = 0.25;
CD0 = 0.065;
CD_alpha = 0.4;
CD_alpha2 = 1.55;

alpha = z(:, 10);
beta = z(:, 24);
Va = z(:, 12);
p = z(:,4);
q = z(:,5);
r = z(:,6);
delta_a = z(:, 28) + delta0(1);
delta_e = z(:, 30) + delta0(2);
delta_r = z(:, 32) + delta0(3);
HLG = z(:, 16);
H = z(:,15);

% calculate beta
Vz = z(:, 14);
V_ax = Vz ./ tan(alpha);
V_ay = sqrt(Va .^ 2 - V_ax .^ 2 - Vz .^ 2);
beta_cal = asin(V_ay ./ Va);

T0 = 288;
H_RWY = H - HLG;
T_RWY = T0 - 6.15 * 10^-3 * H_RWY;
rou = 353 ./ T_RWY .* (T_RWY ./ T0).^5.25;
qd = rou .* Va .* Va / 2;

for i=1:length(z)
    CL = CL0 + CLalpha * alpha(i) + (L / Va(i)) * CLq * q(i) + CL_delta_e * delta_e(i) + CLH * exp(-lambda_L * HLG(i));
    CY = CYbeta * beta(i) + CY_delta_r * delta_r(i);
    CD = CD0 + CD_alpha * alpha(i) + CD_alpha2 * alpha(i) .* alpha(i);
    CX = -CD;
    CZ = -CL;
    Rsb = [cos(alpha(i)), 0, -sin(alpha(i)); 0, 1, 0; sin(alpha(i)), 0, cos(alpha(i))];
    Fa(i,:) = (qd(i) * S * Rsb * [CX; CY; CZ])';
end

% Ma
GA = [ACSP.MIG.dxG; 0; 0];

Cl_beta = -3;
Clp = -15;
Clr0 = 5;
Clra = 35;
Cl_delta_a = -0.7;
Cl_delta_r = 0.2;
Cm0 = -0.3;
Cm_alpha = -1.5;
Cmq = -12;
Cm_delta_e = -1.2;
Cmh0 = -0.09;
Cmh_alpha = -0.9;
lambda_m = 0.15;
Cn_beta0 = 0.85;
Cn_beta_alpha = -1.95;
Cn_p0 = -3;
Cn_p_alpha = -35;
Cnr = -7;
Cn_delta_a = -0.04;
Cn_delta_r = -1.25;

for i = 1: length(z)
    Cl = Cl_beta * beta(i) + (L / Va(i)) * (Clp * p(i) + (Clr0 + Clra * alpha(i)) * r(i)) + Cl_delta_a * delta_a(i) + Cl_delta_r * delta_r(i);
    Cm = Cm0 + Cm_alpha * alpha(i) + (L / Va(i)) * Cmq * q(i) + Cm_delta_e * delta_e(i) + (Cmh0 + Cmh_alpha * alpha(i)) * exp(-lambda_m * HLG(i));
%     Cn = (Cn_beta0 + Cn_beta_alpha) * beta(i) + (L / Va(i)) * (Cnr * r(i) + (Cn_p0 + Cn_p_alpha * alpha(i)) * p(i)) + Cn_delta_a * delta_a(i) + Cn_delta_r * delta_r(i);
    Cn = (Cn_beta0 + Cn_beta_alpha * alpha(i)) * beta(i) + (L / Va(i)) * (Cnr * r(i) + (Cn_p0 + Cn_p_alpha * alpha(i)) * p(i)) + Cn_delta_a * delta_a(i) + Cn_delta_r * delta_r(i);
%     testa = qd(i) * S * L * [Cl; Cm; Cn];
%     testb = cross(GA, Fa(i, :)');
%     qS = qd(i) * S;
%     Ma(i, :) = (qd(i) * S * L * [Cl; Cm; Cn] + cross(GA, Fa(i, :)'))';
    Ma(i, :) = (qd(i) * S * [Cl; Cm; Cn] + cross(GA, Fa(i, :)'))';
end

end

