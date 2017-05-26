function [output_arr, m, n] = myUnsharpMasking(ipimage, window_size, sigma_val, scaling_factor)

    im1 = load(strcat('./../data/',ipimage));
    [m,n] = size(im1.imageOrig);
    imorig1 = im1.imageOrig;

	max_ip = max(max(imorig1));
	min_ip = min(min(imorig1));


    gauss_filter = fspecial('gaussian',window_size, sigma_val);
    blur_img = imfilter(imorig1, gauss_filter, 'replicate');
    umask = imorig1 - blur_img;
    newimg= imorig1 + (scaling_factor * umask);

	max_op = max(max(newimg));
	min_op = min(min(newimg));

    span_intensity_ip = max_ip - min_ip;
    ratio_intensity_ip = (1/span_intensity_ip);

    span_intensity_op = max_op - min_op;
    ratio_intensity_op = (1/span_intensity_op);

    ip_pic1_lc = zeros(m,n);
    op_pic1_lc = zeros(m,n);

    for i = 1: m
        for j = 1 : n
            ip_pic1_lc(i,j) = ((imorig1(i,j) - min_ip) * ratio_intensity_ip);
        end
    end

    for i = 1: m
        for j = 1 : n
            op_pic1_lc(i,j) = ((newimg(i,j) - min_op) * ratio_intensity_op);
        end
    end
    
    output_arr = [ip_pic1_lc  op_pic1_lc];

    
end