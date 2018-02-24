function G = gauss1D( sigma , kernel_size )
    G = zeros(1, kernel_size);
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    %% solution
    f = -floor(kernel_size/2);
    n = floor(kernel_size/2);
    
    % Calculate gaussian for every x between f and n
    for x = f:n
        G(x+floor(kernel_size/2)+1)=(1/(sigma*(sqrt(2*pi))))*exp(-(x^2)/(2*sigma^2));
    end
    
    % Normalize
    G = G/sum(G);
end