function [Gx, Gy, im_magnitude, im_direction] = compute_gradient(image)
	image = imread(image);

    sobel_kernel = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    Gx = conv2(sobel_kernel, image);
    Gy = conv2(sobel_kernel', image);
    
    im_magnitude = sqrt(Gx.^2 + Gy.^2);
    im_direction = atan(Gy./Gx);
end