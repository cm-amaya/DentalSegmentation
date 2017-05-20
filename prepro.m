function [ imout] = prepro( imin,szout )
%Preproccesing
sz=size(imin);

if(numel(sz)==3)
    %Take away color numbers
    dif1=imabsdiff(imin(:,:,1),imin(:,:,2));
    dif1=im2bw(dif1,graythresh(dif1));
    dif2=imabsdiff(imin(:,:,2),imin(:,:,3));
    dif2=im2bw(dif2,graythresh(dif2));
    dif3=imabsdiff(imin(:,:,1),imin(:,:,3));
    dif3=im2bw(dif3,graythresh(dif3));
    dif=or(or(dif1,dif2),dif3);
    imin=times(rgb2gray(imin),uint8(not(dif)));
end

%Resize the image
imout=imresize(imin,szout);
end
