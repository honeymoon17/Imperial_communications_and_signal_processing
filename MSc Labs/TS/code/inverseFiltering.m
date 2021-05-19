function restored_im = inverseFiltering(degrade_im,H)
[width,height] = size(degrade_im);
N = size(H,1);

H_padding = zeros(width,height); 
H_padding(1:N,1:N) = H; % padding the distortion matrix with zeros
H_padding_fft = fft2(H_padding);
degrade_im_fft = fft2(degrade_im);

% Inverse Filtering
restored_im_fft = degrade_im_fft ./ H_padding_fft;
restored_im = ifft2(restored_im_fft);
end

