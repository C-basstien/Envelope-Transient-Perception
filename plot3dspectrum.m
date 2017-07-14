function plot3dspectrum(sig)
%sig temporal signal 

%This function plot the complex spectrum in 3D
%to have a represnetation of the module and phase
%of the fourier decocmposition

%X -> sample frequency axes
%y -> real part of the spectrum
%Z -> imagimary of the spectrum

%note the spectrum is shifted in order to have
%'0Hz' frequency to the centre of the plot
%for a signal of a length of n sample
%the 0Hz will be put at n/2 +1 instead of fs/2
spect=fftshift(fft(sig));
figure;
plot3(1:length(spect),real(spect),imag(spect));

