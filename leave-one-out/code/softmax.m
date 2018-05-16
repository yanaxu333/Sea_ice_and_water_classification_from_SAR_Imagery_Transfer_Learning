
clc
clear

inputSize = 1*4096; % Size of input vector (MNIST images are 28x28)
numClasses = 2;     % Number of classes (MNIST images fall into 7 classes)

lambda = 1e-4; % Weight decay parameter

%step 1

aa=load('17_train_fea.mat');
images=aa.a';

labels = load('17_train_labels.mat');
labels=labels.b;
labels(labels==0) = 2; % Remap 0 to 2

inputData=images;

% Randomly initialise theta
theta = 0.005 * randn(numClasses * inputSize, 1);

%% STEP 2: Implement softmaxCost
%
%  Implement softmaxCost in softmaxCost.m. 

[cost, grad] = softmaxCost(theta, numClasses, inputSize, lambda, inputData, labels);

%% STEP 3: Learning parameters
%
%  Once you have verified that your gradients are correct, 
%  you can start training your softmax regression code using softmaxTrain
%  (which uses minFunc).

options.maxIter = 100;
softmaxModel = softmaxTrain(inputSize, numClasses, lambda, ...
                            inputData, labels, options);
                          
% Although we only use 100 iterations here to train a classifier for the 
% MNIST data set, in practice, training for more iterations is usually
% beneficial.

%% STEP 4: Testing
%
%  You should now test your model against the test images.
%  To do this, you will first need to write softmaxPredict
%  (in softmaxPredict.m), which should return predictions
%  given a softmax model and the input data.
feat1=importdata('fc_18.mat');

feat=feat1;
bb=feat;
images=bb';
load('label_18.mat');
labels = data; 
labels(labels==0) = 2; % Remap 0 to 7

inputData = images;

% You will have to implement softmaxPredict in softmaxPredict.m

[pred] = softmaxPredict(softmaxModel, inputData);

w= softmaxModel.optTheta*inputData;
ww=w(1,:);
qwe=w(1,:);
thresh=(-min(qwe))/((-min(qwe))+max(qwe))
for i=1:size(ww,2)
    ww(i)=ww(i)+(-min(min(ww)));
    ww(i)=ww(i)/max(max(ww));
end;
acc = mean(labels(:) == pred(:));
fprintf('Accuracy: %0.3f%%\n', acc * 100);

pred1=pred';
for rr=1:size(pred1);
    if pred1(rr,1)==2;
       pred1(rr,1)=0;% 0 represents water and 1 represents ice
    end;
end;

save('/home/lein/yan2/prob_map/prob_17.mat','ww');
%%%%%%%%%%%%%%%%%
%my stuff: calculate the required prob by Andrea
% ice:1 water:2
pred2=pred;

ice_is_ice=0;
ice_is_water=0;
water_is_water=0;
water_is_ice=0;
for i=1:size(labels,1)
    if labels(i)==1 && pred2(i)==1
        ice_is_ice=ice_is_ice+1;
    end;
    if labels(i)==1 && pred2(i)==2
        ice_is_water=ice_is_water+1;
    end;
    if labels(i)==2 && pred2(i)==2 
        water_is_water=water_is_water+1;
    end;
    if labels(i)==2 && pred2(i)==1 
        water_is_ice=water_is_ice+1;
    end;
end;
fprintf('proportion correct ice: %0.3f%%\n', (ice_is_ice/(ice_is_ice+ice_is_water)) * 100);
fprintf('proportion correct water: %0.3f%%\n', (water_is_water/(water_is_water+water_is_ice)) * 100);




%probability of ice 