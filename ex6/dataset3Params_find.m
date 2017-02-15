load('ex6data3.mat');

sigmas = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
CValues = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]

minErr = Inf;

for s = sigmas
  for c = CValues
    model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));
    predictions = svmPredict(model, Xval);
    err = mean(double(predictions ~= yval));
    if err < minErr
      minErr = err
      sigma = s
      C = c
    end
  end
end

minErr
sigma
C
