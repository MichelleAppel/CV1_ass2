function [ PSNR ] = myPSNR( orig_image, approx_image )
sqrt(immse(orig_image, approx_image))
PSNR = 20 * log10(double(max(max(orig_image))) / sqrt(immse(orig_image, approx_image)));

end

