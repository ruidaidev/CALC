function [Fa,Ma] = aero_calculation(z)

Fa = zeros(length(z), 3);
Ma = 0;

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
q = z(:,5);
r = z(:,6);
delta_e = z(:, 30);
delta_r = z(:, 32);
HLG = z(:, 16);
H = z(:,15);

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

end

