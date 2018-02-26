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

imName = char(strcat('gen_images/', image(15:22), '_', ...
    kernel_type, '_', string(kernel_size), '.jpg'));
image = imread(image);

switch kernel_type
    case 'box'
        imOut = imboxfilt(image, kernel_size);
    case 'median'
        imOut = medfilt2(image, [kernel_size kernel_size]);
    case 'gaussian'
        gaussFilter = gauss2D(sigma, kernel_size);
        imOut = imfilter(image, gaussFilter);
end

imshow(imOut);
imwrite(imOut, imName);

end
