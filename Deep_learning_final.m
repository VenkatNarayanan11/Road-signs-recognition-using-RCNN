    mov = VideoReader('CounterClockwise.mp4');
   while (1)
        pic = readFrame(mov);
        pic = imresize(pic,0.5);
        [bboxes,score,label] = detect(rcnn,pic,'MiniBatchSize',128);
        [score, idx] = max(score);
        bbox = bboxes(idx, :);
        annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
        outputImage = insertObjectAnnotation(pic, 'rectangle', bbox, annotation);
        imshow(outputImage);
        if label == 'stop_sign'
            disp('STOP')
            pause(0.5);
            clc;
        elseif label == 'school_sign'
            disp('School Zone')
            pause(0.5);
            clc;
        end
   end
