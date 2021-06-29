function result =konusanibul(fileName, M, S)
    [audioIn, fs] = audioread(fileName);

    windowLength = round(0.03*fs);
    overlapLength = round(0.025*fs);

    melC = mfcc(audioIn,fs,'Window',hamming(windowLength,'periodic'),'OverlapLength',overlapLength);
    f0 = pitch(audioIn,fs,'WindowLength',windowLength,'OverlapLength',overlapLength);
    features = [melC,f0];

    voicedSpeech = isVoicedSpeech(audioIn, fs, windowLength, overlapLength);
    features(~voicedSpeech,:) = [];
    features = (features-M)./S;

    output = myNeuralNetworkFunction(features);

    [~, arg] = max(output, [], 2);
    result = mode(arg);
end

