%Tehtava 7
im = zeros(4,4,3);
im(1,:,1) = uint8(255) 
im(2,:,2) = uint8(255)
im(3,:,3) = uint8(255)

% init picture
figure(1)
imagesc(im)
axis off
axis equal

im2 = zeros(4,4,3);
scales = [255, round(255*3/4), round(255/2), round(255/4)];

for iii = 1:3
   im2(iii,:,iii) = scales;
   im2(4,:,iii) = scales;
end

im2 = uint8(im2);

figure(2)
imagesc(im2)
axis off
axis equal
