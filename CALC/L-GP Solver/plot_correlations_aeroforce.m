function [] = plot_correlations_aeroforce(u, yout)
    p=yout(end,20);
    q=yout(end,21);
    r=yout(end,22);
    phi=yout(end,23);
    theta=yout(end,24);
    psi=yout(end,25);
    alpha=yout(end,26);
    Vc=yout(end,27);
    Va=yout(end,28);
    beta=yout(end,40);

    Fa_x=yout(end,41);
    Fa_y=yout(end,42);
    Fa_z=yout(end,43);
    
    % Fa_x
    figure(1)
    subplot(5,1,1)
    scatter(p, Fa_x)
    hold on
    xlabel('p')
    ylabel('Fa_x')

    subplot(5,1,2)
    scatter(q, Fa_x)
    hold on
    xlabel('q')
    ylabel('Fa_x')

    subplot(5,1,3)
    scatter(r, Fa_x)
    hold on
    xlabel('r')
    ylabel('Fa_x')

    subplot(5,1,4)
    scatter(alpha, Fa_x)
    hold on
    xlabel('alpha')
    ylabel('Fa_x')

    subplot(5,1,5)
    scatter(Va, Fa_x)
    hold on
    xlabel('Va')
    ylabel('Fa_x')

    % Fa_y
    figure(2)
    subplot(5,1,1)
    scatter(p, Fa_y)
    hold on
    xlabel('p')
    ylabel('Fa_y')

    subplot(5,1,2)
    scatter(q, Fa_y)
    hold on
    xlabel('q')
    ylabel('Fa_y')

    subplot(5,1,3)
    scatter(r, Fa_y)
    hold on
    xlabel('r')
    ylabel('Fa_y')

    subplot(5,1,4)
    scatter(alpha, Fa_y)
    hold on
    xlabel('alpha')
    ylabel('Fa_y')

    subplot(5,1,5)
    scatter(Va, Fa_y)
    hold on
    xlabel('Va')
    ylabel('Fa_y')

    % Fa_z
    figure(3)
    subplot(5,1,1)
    scatter(p, Fa_z)
    hold on
    xlabel('p')
    ylabel('Fa_z')

    subplot(5,1,2)
    scatter(q, Fa_z)
    hold on
    xlabel('q')
    ylabel('Fa_z')

    subplot(5,1,3)
    scatter(r, Fa_z)
    hold on
    xlabel('r')
    ylabel('Fa_z')

    subplot(5,1,4)
    scatter(alpha, Fa_z)
    hold on
    xlabel('alpha')
    ylabel('Fa_z')

    subplot(5,1,5)
    scatter(Va, Fa_z)
    hold on
    xlabel('Va')
    ylabel('Fa_z')

end

