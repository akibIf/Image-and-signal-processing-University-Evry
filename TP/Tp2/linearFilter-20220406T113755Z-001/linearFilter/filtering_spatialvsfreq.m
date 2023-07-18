% image filtering
% low-pass filter
% author P. LE CALLET

% convolution kernel 
support = 32;
filter1 = ones(support)/(support*support);
nb_point=512;
% FFT
spectrum_filter1 = fftshift(fft2(filter1,nb_point,nb_point));

% To read a square image
im1 = imread('mandrill_lumi.bmp','bmp');
size1 = size(im1,1);

% spatial filtering
tic    
imf = imfilter(im1,filter1,'replicate');    
time_spatialFiltering = toc  

% frequency filtering: image FFT then multiplicatiob with the filter FFT
% then IFFT
tic
spectrum_im1 = fftshift(fft2(im1,nb_point,nb_point))/(size1*size1);
spectrum_imf = spectrum_filter1.*spectrum_im1;
imf2 = ifft2(fftshift(spectrum_imf));   
time_freqFiltering = toc     
   