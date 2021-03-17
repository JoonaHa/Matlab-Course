% the image is in its original size so execution may take a while
% University laptop took about 50 seconds to complete the script
image_orig = imread('italia_maisema.jpg');

% Choose the blue channel
image_blue = image_orig(:,:,3);

% Pick a part for inpainting
image_blue_part = image_blue(2908:3067, 1095:1340);

% calculate the actual inpainting area rows and colums
[row0,col0] = size(image_blue_part);
row = row0-2;
col = col0-2;

 % use function INPAINT to calculate the averages for the inpainting
 b = INPAINT(image_blue_part, row, col);
 % insert the results to the part of the image
 image_blue_part2 = image_blue_part;
 image_blue_part2(2:(end-1),2:(end-1)) = reshape(b,[row,col]);


% this time choose all rgb channels
image_all = image_orig;
image_red = image_orig(:,:,1);
image_green = image_orig(:,:,2);
image_blue = image_orig(:,:,3);
% Pick out the part of images to be inpainted
image_r_part = image_red(2908:3067, 1095:1340);
image_g_part = image_green(2908:3067, 1095:1340);
image_b_part = image_blue(2908:3067, 1095:1340);

 % calculate the averages
 r = INPAINT(image_r_part, row, col);
 g = INPAINT(image_g_part, row, col);
 b = INPAINT(image_b_part, row, col);

 %insert the results
 image_r_part(2:(end-1),2:(end-1)) = reshape(r,[row,col]);
 image_g_part(2:(end-1),2:(end-1)) = reshape(g,[row,col]);
 image_b_part(2:(end-1),2:(end-1)) = reshape(b,[row,col]);
 
 
 % Show completed images in their own windows
 figure(1)
 clf
 image_blue(2908:3067, 1095:1340) = image_blue_part2;
 imshow(uint8(image_blue))

 figure(2)
 clf
 image_red(2908:3067, 1095:1340) = image_r_part;
 image_green(2908:3067, 1095:1340) = image_g_part;
 image_blue(2908:3067, 1095:1340) = image_b_part;
 image_all(:,:,1) = image_red;
 image_all(:,:,2) = image_green;
 image_all(:,:,3) = image_blue;
 imshow(uint8(image_all))


% Function for calulating the inpainting
function RESULT=INPAINT(image_part,row,col)
  image_part = double(image_part);

  % use FD_Laplace to calculate the system matrix
  A = FD_Laplace(row,col);

  vec_t = image_part(1,2:(end-1)); % Top boundary
  vec_b = image_part(end,2:(end-1)); % Bottom boundary
  vec_l = image_part(2:(end-1),1); % Left
  vec_r = image_part(2:(end-1),end); % Right

  % solve the actual matrix
  b = zeros(row*col,1);
  for iii= 1:row
      for jjj = 1:col
          ind = (jjj-1)*row+iii;
          if iii==1
              b(ind) = b(ind)+vec_t(jjj);
          end
          if iii==row
              b(ind) = b(ind)+vec_b(jjj);
          end
          if jjj==1
              b(ind) = b(ind)+vec_l(iii);
          end
          if jjj==col
              b(ind) = b(ind)+vec_r(iii);
          end     
      end
  end

  %return value
  RESULT = A\b;
end

