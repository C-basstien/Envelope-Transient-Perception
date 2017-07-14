function test_spctr_env()
    close all;
    x=audioread('glockenspiel.wav');% x -temporal signal 
     figure;
     plot(x);
     figure;
     X = (abs(dft(x)));% norm of the dft(x) -frequency domain
     plot(fftshift(X));
    Xlog = (log(X));% log spectrum
    figure;
    plot(fftshift(Xlog));hold on;
    smlgsp=smooth_spectrum(Xlog,'Rectangular',[],[]);%smooth log spectrum
    plot(fftshift(smlgsp));hold on;
    smlgsp=smooth_spectrum(Xlog,[],[],[]);%smooth log spectrum with the window describe in the paper
    plot(fftshift(smlgsp));hold on;%almost the same, not a big deal...
    