function [Gx, Gy, im_magnitude, im_direction] = compute_gradient(image)
	%image = imread(image);

    sobel_kernel = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    Gx = double(imfilter(image, sobel_kernel));
    Gy = double(imfilter(image, sobel_kernel'));
    
    im_magnitude = sqrt(Gx.^2 + Gy.^2);
    im_direction = atan(Gy./Gx);
end