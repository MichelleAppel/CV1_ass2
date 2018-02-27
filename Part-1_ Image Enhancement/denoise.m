function [ imOut ] = denoise( image, kernel_type, varargin)

clc % clear command window

switch nargin
    case 2
        disp('2 inputs given')
        kernel_size = 3;            % default
        sigma = 1;                  % default
    case 3
        disp('3 inputs given')
        kernel_size = varargin{1};  % first arg
        sigma = 1;                  % default
    case 4
        disp('4 inputs given')
        kernel_size = varargin{1};  % first arg
        sigma = varargin{2};        % second arg
end


switch kernel_type
    case 'box'
        imName = char(strcat('gen_images/', image(15:22), ...
            '_box_', string(kernel_size), '.jpg'));
        imOut = imboxfilt(imread(image), kernel_size);
    case 'median'
        imName = char(strcat('gen_images/', image(15:22), ...
            '_median_', string(kernel_size), '.jpg'));
        imOut = medfilt2(imread(image), [kernel_size kernel_size]);
    case 'gaussian'
        imName = char(strcat('gen_images/', image(15:22), ...
            '_gaussian_', string(kernel_size), ...
            '_sigma_', string(sigma), '.jpg'));
        gaussFilter = gauss2D(sigma, kernel_size);
        imOut = imfilter(imread(image), gaussFilter);
end

imshow(imOut);
imwrite(imOut, imName);

end
