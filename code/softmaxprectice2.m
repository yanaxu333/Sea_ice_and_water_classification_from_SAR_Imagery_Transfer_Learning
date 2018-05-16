
clc
clear
inputSize = 1*4096; % Size of input vector (MNIST images are 28x28)
numClasses = 2;     % Number of classes (MNIST images fall into 7 classes)

lambda = 1e-4; % Weight decay parameter

%step 1


load('feat6.mat');
aa=data;
images=aa';
load('train_label.mat');
labels = data;
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
feat1=importdata('f6_4_1.mat');
feat2=importdata('f6_4_2.mat');
feat=[feat1;feat2];
bb=feat;
images=bb';
load('label_4.mat');
labels = data; 
labels(labels==0) = 2; % Remap 0 to 7

inputData = images;

% You will have to implement softmaxPredict in softmaxPredict.m
[pred] = softmaxPredict(softmaxModel, inputData);


acc = mean(labels(:) == pred(:));
fprintf('Accuracy: %0.3f%%\n', acc * 100);
pred1=pred';
for rr=1:size(pred1);
    if pred1(rr,1)==2;
       pred1(rr,1)=0;
    end;
end;
save('pred_4.mat','pred1');
