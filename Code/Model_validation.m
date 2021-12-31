% To check output of specific images -->>
%{
%I= imread("seg_test/street/24292.jpg");
%I = imresize(I, [227 227]);
%[Ypred, prob] = classify(trainedNetwork_1, I);
%imshow(I)
%label = Ypred;
%title(string(label)+","+num2str(100*max(prob),3)+ "%");
%}

% Randomly sample and count all the wrong predictions in a particular class
% -->>
%{
list = {'buildings', 'forest', 'glacier', 'mountain', 'sea', 'street'};
for j=1:6
    d = 'seg_test/'+string(list(j));
    f = dir([d '\*.jpg']);
    fail_counter = 0;
    for i=1:50
        n = numel(f);
        idx = randi(n);
        im=imread(f(idx).name);
        I = imresize(I, [227 227]);
        [Ypred, prob] = classify(trainedNetwork_1, I);
        if Ypred ~= string(list(j))
            fail_counter = fail_counter+1;
        end
        
    end
    disp("For"+string(list(j))+"Fails="+string(fail_counter));
end
    
%disp(fail_counter);
%}

I= imread("seg_train/mountain/20052.jpg");
I = imresize(I, [227 227]);
[Ypred, prob] = classify(trainedNetwork_1, I);
imshow(I)
label = Ypred;
title(string(label)+","+num2str(100*max(prob),3)+ "%");

