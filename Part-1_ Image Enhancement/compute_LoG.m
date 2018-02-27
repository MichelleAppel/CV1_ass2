function imOut = compute_LoG(image, LOG_type)
image = imread(image);

switch LOG_type
    case 1
        %method 1
        G2D = gauss2D(0.5, 5);
        im = imfilter(image, G2D);
        [~, ~, ~, im_direction] = compute_gradient(im);
        [~, ~, ~, imOut] = compute_gradient(im_direction);
        
    case 2
        %method 2
        LoG1D = 
        
    case 3
        %method 3
        fprintf('Not implemented\n')

end
end