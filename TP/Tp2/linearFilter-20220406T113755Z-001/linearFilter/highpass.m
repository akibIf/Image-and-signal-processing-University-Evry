% image filtering
% high-pass filtering
% author P. LE CALLET
    clear all
    close all
    %o the image size is 512 x 512
	size1 = 512;
	% convolution kernel
	filter1 = [-1 -1 -1; 0 0 0; 1 1 1];
    support=size(filter1,1);
   % To compute the FFT 
   % number of points for computing the FFT2D according to one dimension
    nb_point = size1;
    
	spectrum_filter1 = fftshift(fft2(filter1,nb_point,nb_point))/(support*support);
   % normalized frequencies
	vt =(-size1/2:size1/nb_point:(size1/2-size1/nb_point))/size1;
   % modulus of the FFT
    figure(1);
	imagesc(vt,vt,abs(spectrum_filter1));
	colormap('default');   

   
	
  	% to read a square image
   im1 = imread('fruit_lumi.bmp','bmp');
   size1 = size(im1,1)
   % to display the image
   figure(2); 
   imshow(im1);
  
   
   % spatial filtering
   imf1 = imfilter(im1,filter1,'replicate');
   figure(3)
   map = 0:1/255:1;
   map = [map',map',map'];
   imagesc(abs(double(imf1)));
   colormap(map);
   
   % example of another filter
   filter2 = [-1 0 1;-1 0 1; -1 0 1];
   imf2 = imfilter(im1,filter2,'replicate');
   figure(4)
   imagesc(abs(double(imf2)));
   colormap(map);
   