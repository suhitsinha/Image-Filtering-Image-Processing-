function [op_image_final, spacial_mask, m, n, RMSD] = myPatchBasedFiltering(ipimage, window_size, patch_size, sigma, sigma_gauss, factor_resize)

    ip_image = load(strcat('./../data/',ipimage));
    ip_image_val1 = ip_image.imageOrig;
    ip_image_val2 = imresize(ip_image_val1,factor_resize);
    [m,n] = size(ip_image_val2);
    
    max_intensity = max(max(ip_image_val2));
    min_intensity = min(min(ip_image_val2));
    intensity_range = max_intensity - min_intensity;
    noise_data = intensity_range*.04 * randn(m,n);
    ip_image_val = ip_image_val2 + noise_data;
    
    op_image = zeros(m,n);
    patch_mask = fspecial('gaussian', patch_size, sigma_gauss);
    dim_size = floor(window_size/2);
    patch_dim_size = floor(patch_size/2);
    
    for i = 1: m
        for j= 1:n
            window_imin = max(1,i-dim_size);
            window_imax = min(m,i+dim_size);
            window_jmin = max(1,j-dim_size);
            window_jmax = min(n,j+dim_size);
            
            op_window = zeros(m ,n);
            for k = window_imin : window_imax
                for l = window_jmin : window_jmax
                    patch_imin = max(window_imin,k - patch_dim_size);
                    patch_imax = min(window_imax,k + patch_dim_size);
                    patch_jmin = max(window_jmin,l - patch_dim_size);
                    patch_jmax = min(window_jmax,l + patch_dim_size);
                        
                    starti_patch = (1+ (patch_dim_size - k + patch_imin));
                    endi_patch = (patch_size - (patch_dim_size - patch_imax + k));
                    startj_patch = (1+ (patch_dim_size - l + patch_jmin));
                    endj_patch = (patch_size - (patch_dim_size - patch_jmax + l));
                    ip_patch_image = ip_image_val(patch_imin:patch_imax,patch_jmin:patch_jmax);
                    gaussian_weight_patch = ip_patch_image .* patch_mask(starti_patch : endi_patch, startj_patch : endj_patch);
                    op_window(k,l)= sum(sum(gaussian_weight_patch))/ sum(sum(patch_mask(starti_patch : endi_patch, startj_patch : endj_patch)));
                end
            end

            window_distance = (op_window(window_imin : window_imax,window_jmin : window_jmax) - op_window(i,j)) .^2;
            window_gaussian = exp((-(window_distance))/(2 * sigma^2));
            op_image(i,j) = sum(sum(ip_image_val(window_imin: window_imax, window_jmin: window_jmax) .* window_gaussian))/ sum(sum(window_gaussian));
        end
    end

    op_image_final = [ip_image_val2 ip_image_val op_image];
    spacial_mask = imresize(patch_mask, 20);
    RMSD = sqrt((1/(m*n))*(sum(sum((ip_image_val2 - op_image) .* (ip_image_val2 - op_image)))));

end