%% Edge-preserving Smoothing using Bilateral Filtering

tic;
%% optimal solution sigma_spacial = 1.4 sigma_intensity = 10;
% Defining the parameters
sigma_spacial = 1.4;    %Sigma Spacial parameter
sigma_intensity = 10;   %Sigma Intensity parameter
window_size = 15;       %Window Size parameter

%%
[RMSD, output_image, rms_value,m, n] = myBilateralFiltering('barbara',window_size,sigma_spacial,sigma_intensity);

%%
%
% Output images
%%
figure
imshow(output_image,[]), title('Original image(left), Noised image(middle) and filtered image(right)'), colorbar;
axis([1 3*n 1 m]), axis on 
%%
%
% Spacial mask as image:
figure
imshow(imresize(rms_value,20),[]), title('Spacial gaussian value increasing 20 times'), colorbar;
%%Parameter Values
%
% The parameter values are as follows:
disp(strcat('The RMSD value is: ', num2str(RMSD)));
disp(strcat('The Sigma spacial value is: ', num2str(sigma_spacial)));
disp(strcat('The Sigma intensity value is: ', num2str(sigma_intensity)));
disp(strcat('The window size parameter value is: ', num2str(window_size)));

toc;

%% sigma_spacial = .9*optimal sigma_spacial sigma_intensity = 10

tic;
%% 
% Defining the parameters
sigma_spacial = .9*1.4;    %Sigma Spacial parameter
sigma_intensity = 10;   %Sigma Intensity parameter
window_size = 15;       %Window Size parameter

%%
[RMSD, output_image, rms_value,m, n] = myBilateralFiltering('barbara',window_size,sigma_spacial,sigma_intensity);

%%
%
% Output images
%%
figure
imshow(output_image,[]), title('Original image(left), Noised image(middle) and filtered image(right)'), colorbar;
axis([1 3*n 1 m]), axis on 
%%
%
% Spacial mask as image:
figure
imshow(imresize(rms_value,20),[]), title('Spacial gaussian value increasing 20 times'), colorbar;
%%Parameter Values
%
% The parameter values are as follows:
disp(strcat('The RMSD value is: ', num2str(RMSD)));
disp(strcat('The Sigma spacial value is: ', num2str(sigma_spacial)));
disp(strcat('The Sigma intensity value is: ', num2str(sigma_intensity)));
disp(strcat('The window size parameter value is: ', num2str(window_size)));

toc;



%% sigma_spacial = 1.1*optimal sigma_spacial sigma_intensity = 10

tic;
%% 
% Defining the parameters
sigma_spacial = 1.1*1.4;    %Sigma Spacial parameter
sigma_intensity = 10;   %Sigma Intensity parameter
window_size = 15;       %Window Size parameter

%%
[RMSD, output_image, rms_value,m, n] = myBilateralFiltering('barbara',window_size,sigma_spacial,sigma_intensity);

%%
%
% Output images
%%
figure
imshow(output_image,[]), title('Original image(left), Noised image(middle) and filtered image(right)'), colorbar;
axis([1 3*n 1 m]), axis on 
%%
%
% Spacial mask as image:
figure
imshow(imresize(rms_value,20),[]), title('Spacial gaussian value increasing 20 times'), colorbar;
%%Parameter Values
%
% The parameter values are as follows:
disp(strcat('The RMSD value is: ', num2str(RMSD)));
disp(strcat('The Sigma spacial value is: ', num2str(sigma_spacial)));
disp(strcat('The Sigma intensity value is: ', num2str(sigma_intensity)));
disp(strcat('The window size parameter value is: ', num2str(window_size)));

toc;




%% sigma_spacial = 1.4 sigma_intensity = .9 * optimal sigma_intensity

tic;
%% 
% Defining the parameters
sigma_spacial = 1.4;    %Sigma Spacial parameter
sigma_intensity = .9*10;   %Sigma Intensity parameter
window_size = 15;       %Window Size parameter

%%
[RMSD, output_image, rms_value,m, n] = myBilateralFiltering('barbara',window_size,sigma_spacial,sigma_intensity);

%%
%
% Output images
%%
figure
imshow(output_image,[]), title('Original image(left), Noised image(middle) and filtered image(right)'), colorbar;
axis([1 3*n 1 m]), axis on 
%%
%
% Spacial mask as image:
figure
imshow(imresize(rms_value,20),[]), title('Spacial gaussian value increasing 20 times'), colorbar;
%%Parameter Values
%
% The parameter values are as follows:
disp(strcat('The RMSD value is: ', num2str(RMSD)));
disp(strcat('The Sigma spacial value is: ', num2str(sigma_spacial)));
disp(strcat('The Sigma intensity value is: ', num2str(sigma_intensity)));
disp(strcat('The window size parameter value is: ', num2str(window_size)));

toc;





%% sigma_spacial = 1.4 sigma_intensity = 1.1 * optimal sigma_intensity

tic;
%% 
% Defining the parameters
sigma_spacial = 1.4;    %Sigma Spacial parameter
sigma_intensity = 1.1*10;   %Sigma Intensity parameter
window_size = 15;       %Window Size parameter

%%
[RMSD, output_image, rms_value,m, n] = myBilateralFiltering('barbara',window_size,sigma_spacial,sigma_intensity);

%%
%
% Output images
%%
figure
imshow(output_image,[]), title('Original image(left), Noised image(middle) and filtered image(right)'), colorbar;
axis([1 3*n 1 m]), axis on 
%%
%
% Spacial mask as image:
figure
imshow(imresize(rms_value,20),[]), title('Spacial gaussian value increasing 20 times'), colorbar;
%%Parameter Values
%
% The parameter values are as follows:
disp(strcat('The RMSD value is: ', num2str(RMSD)));
disp(strcat('The Sigma spacial value is: ', num2str(sigma_spacial)));
disp(strcat('The Sigma intensity value is: ', num2str(sigma_intensity)));
disp(strcat('The window size parameter value is: ', num2str(window_size)));

toc;

