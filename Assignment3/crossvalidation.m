function [ret] = crossvalidation(k,fun,points,classes)
    dispatcher = crossvalind('Kfold',size(points,1),5);
    ret = dispatcher;
    all_i = 1:k;
    for test_i = all_i,
        %others_i = all_i(boolean(1 - (all_i == test_i)));
        test_01 = dispatcher == test_i;
        training_01 = boolean(1 - (dispatcher == test_i));
        test_points = points(test_01);
        training_points = points(training_01);
        test_classes = classes(test_01);
        training_classes = classes(training_01);
        
        % training and testing is done in 'fun'
        err = fun(traning_points,training_classes,test_points,training_classes);
    end
end