function [] = plot_correlations(u, yout, input_parameter, nfig)
    figure(nfig)
    p=yout(end,20);
    q=yout(end,21);
    r=yout(end,22);
    phi=yout(end,23);
    theta=yout(end,24);
    psi=yout(end,25);
    alpha=yout(end,26);
    Vc=yout(end,27);
    Va=yout(end,28);
    beta=yout(end,end);
    
    if input_parameter=='delta_a'
        u_element = u(2);
    elseif input_parameter=='delta_e'
        u_element = u(3);
    elseif input_parameter=='delta_r'
        u_element = u(4);
    end

    
    subplot(5,1,1)
    scatter(p, u_element)
    hold on
    xlabel('p')
    ylabel(input_parameter)

    subplot(5,1,2)
    scatter(q, u_element)
    hold on
    xlabel('q')
    ylabel(input_parameter)

    subplot(5,1,3)
    scatter(r, u_element)
    hold on
    xlabel('r')
    ylabel(input_parameter)

    subplot(5,1,4)
    scatter(alpha, u_element)
    hold on
    xlabel('alpha')
    ylabel(input_parameter)

    subplot(5,1,5)
    scatter(Va, u_element)
    hold on
    xlabel('Va')
    ylabel(input_parameter)
end

