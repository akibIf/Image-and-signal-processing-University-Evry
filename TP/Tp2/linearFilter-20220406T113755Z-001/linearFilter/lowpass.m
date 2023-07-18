% image filtering
% low-pass filter
% author P. LE CALLET

% definition of the convolution kernel
clear all
close all
support = 5;
filter1 = ones(support)/(support*support)

	% To compute the FFT
    % the image sizes are 512 x 512
	size1 = 512;
    % FFT (no-padding)
	spectrum_filter1 = fftshift(fft2(filter1,size1,size1))/(support*support);
    % Normalized frequencies
	vt =(-size1/2:size1/size1:(size1/2-size1/size1))/size1;
    % modulus of the FFT
    figure(1);
	imagesc(vt,vt,abs(spectrum_filter1));
	colormap('default');
    
    %end of the first part 

  
	
   % to read the image
   im1 = imread('mandrill_lumi.bmp','bmp');
   size1 = size(im1,1);
   % to display the image
   figure(2);
   imshow(im1);
   % spatial filtering
   imf = conv2(im1,filter1);
   imf2 = conv2(im1,filter1,'same');
   % to display
   figure(3)
   subplot(1,2,1)
   image(imf)
   map = 0:1/255:1;
   map = [map',map',map'];
   colormap(map);
   subplot(1,2,2)
   image(imf2)
   % end of the second part
   
   % spatial fitering with imfilter
   imf3 = imfilter(im1,filter1);
   imf4 = imfilter(im1,filter1,'replicate');
   %affichage
   figure(4)
   subplot(1,2,1)
   image(imf3)
   subplot(1,2,2)
   image(imf4)
   colormap(map);
   
   % end of the third part
   
   % frequency filtering
   % we calculate the FFT of the image and the filtered image 
   nb_point = size1;
   spectrum_im1 = fftshift(fft2(im1,nb_point,nb_point))/(size1*size1);
   spectrum_imf4 = fftshift(fft2(imf4,nb_point,nb_point))/(size1*size1);
   vt =(-size1/2:size1/nb_point:(size1/2-size1/nb_point))/size1;
   figure(5);
   subplot(1,2,1)
   imagesc(vt,vt,20*log10(abs(spectrum_im1)),[-100,100]);
   subplot(1,2,2)
   imagesc(vt,vt,20*log10(abs(spectrum_imf4)),[-100,100]);
   colormap(map)  
   
   