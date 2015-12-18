% x = {'hello.png'};
% y = '.png';
% k = strfind(char(x), y);
% 
% if ~isempty(k)
%     disp('hello')
% end
% 
% images_col = '00003435.png';
% first_val = 2323;
% second_val = 2324;
% 
%  mid_val = floor(first_val + (second_val - first_val) / 2);
%  img = ['0000' num2str(mid_val) '.png'];
%  images_col = [images_col; img]
%  
%  
 
%  A = [{'111.png'} {'114.png'}; {'112.png'} []; {'113.png'} []; {'114.png'} []; {'115.png'}];
%  s = size(A, 1)
%  
%  first_image = A(1,1);
%  second_image = A(1,1);
%  k = strfind(char(second_image), '.png');
%     
%  counter = 1;
%  while ~isempty(k) && counter < s
%      counter = counter + 1;
%      second_image = A(counter,1);
%      k = strfind(char(second_image), '.png');
%  end
%  
%  first_image
%  second_image
% 


a = [ 1 ; 3 ;4; 5; 6; 8; 7];
for x = a'
    x
end




    