function imOut = compute_LoG(image, LOG_type)

switch LOG_type
    case 1
        % method 1: Smoothing the image with a Gaussian kernel (kernel size of 5 and
        % standard deviation of 0.5), then taking the Laplacian of the smoothed image
        % (i.e. second derivative).
        G2D = gauss2D(0.5, 5);
        im = imfilter(image, G2D, 'conv');
        [~, ~, ~, im_direction] = compute_gradient(im);
        [~, ~, ~, imOut] = compute_gradient(im_direction);
        
    case 2
        % method 2: Convolving the image directly with a LoG kernel (kernel size of 5
        % and standard deviation of 0.5).
        L2D = LoG2D(0.5, 5);
        imOut = imfilter(image, L2D, 'conv');
        
    case 3
        % method 3: Taking the Difference of two Gaussians (DoG) computed at different
        % scales sigma1 and sigma2.
        G2D1 = gauss2D(0.5, 11);
        im1 = imfilter(image, G2D1, 'conv');
        
        G2D2 = gauss2D(5, 101);
        im2 = imfilter(image, G2D2, 'conv');
        
        imOut = im1 - im2;

end
end