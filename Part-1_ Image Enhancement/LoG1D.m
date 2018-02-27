function G = LoG1D( sigma , kernel_size )
    G = zeros(1, kernel_size);
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    %% solution
    n = floor(kernel_size/2);

    % Calculate gaussian for every x between f and n
    for x = -n:n
        G(x+floor(kernel_size/2)+1)= (((x^2 / sigma^4) - (1 / sigma^2)) * exp(-(x^2) / (2*sigma^2)) );
    end
    
    % Normalize
    G = G/sum(abs(G));
end