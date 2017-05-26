function [RMSD, output_image, rms_value,m, n] = myBilateralFiltering(ipimage, window_size, sigd, sigr)
    ip_image = load(strcat('./../data/',ipimage));
    [m,n] = size(ip_image.imageOrig);
    ip_image_val = ip_image.imageOrig;
    max_intensity = max(max(ip_image_val));
    min_intensity = min(min(ip_image_val));
    intensity_range = max_intensity - min_intensity;
    noise_data = intensity_range*.05 * randn(m,n);
    noisy_image = ip_image_val + noise_data;
    op_pic = zeros(m,n);
    dim_size= floor(window_size/2);
    rms = zeros(window_size, window_size);
	for k = 1: window_size
        for l = 1 : window_size
            rms(k,l) = -(((dim_size - k + 1)^2 + (dim_size - l + 1)^2)/(2*sigd^2));
        end
	end
    rms_value(:,:) = exp (rms(:,:));
    
	for i = 1: m
        for j = 1 : n
            imin = max(1,i-dim_size);
            imax = min(m,i+dim_size);
            jmin = max(1,j-dim_size);
            jmax = min(n,j+dim_size);
            intensity_diff = -(((noisy_image(imin:imax, jmin:jmax) - noisy_image(i,j)) .^2) / (2 * sigr^2));
            starti = (1+ (dim_size - i + imin));
            endi = (window_size - (dim_size - imax + i));
            startj = (1 + (dim_size - j + jmin));
            endj = (window_size - (dim_size - jmax + j));
            weight_mat = exp(intensity_diff + rms(starti : endi, startj : endj));
            op_pic(i,j) = sum(sum(noisy_image(imin:imax,jmin:jmax).*weight_mat))/ sum(sum(weight_mat));
        end
	end            

    output_image = [ip_image_val noisy_image op_pic];
    
    %{
    figure
    subplot(2,2,1);
    imshow(ip_image_val,[]), title('Original image'), colorbar;
    axis([1 n 1 m]), axis on  
    
    subplot(2,2,2);
    imshow(noisy_image,[]), title('Original image with gaussian noise'), colorbar;
    axis([1 n 1 m]), axis on    
    
    subplot(2,2,3);
    imshow(op_pic,[]), title('Image after Bilateral filtering'), colorbar;
    axis([1 n 1 m]), axis on
    
    subplot(2,2,4);
    imshow(rms_value,[]), title('Image of spacial mask'), colorbar;
    axis([1 window_size 1 window_size]), axis on
     %}
    RMSD = sqrt((1/(m*n))*(sum(sum((ip_image_val - op_pic) .* (ip_image_val - op_pic)))));
   
end