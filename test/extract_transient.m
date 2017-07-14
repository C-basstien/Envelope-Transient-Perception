function extract_transient()
close all;
x=audioread('C:\Users\Sebastien\Documents\MATLAB\Lib\StrucAudioToolboxV03\StrucAudioToolboxV03\Signals\glockenspiel.wav');
sig=x(1:14000)
[stat_est, tran_est, res, pars, lambda]=ICS_dyn_mod(sig);
figure;
% subplot(2,2,1)
plot(sig)
title('x(t)')
% subplot(2,2,2)
% plot(fft(sig(:,2)))
% title('FFT{x(t)}(f)')

figure;
% subplot(2,2,1)
plot(stat_est)
title('stat_est')



figure;
% subplot(2,2,1)
plot(tran_est)
title('tran_est')

env_sig= estimate_env(sig,[]);
env_stat= estimate_env(stat_est,[]);
env_trans= estimate_env(tran_est,[]);
figure;

plot(env_sig);
hold on;
plot(env_stat);
hold on;
plot(env_trans);
title('temporal sig sig & stat & trans');
spect_sig=abs(fft(sig));
spect_stat=abs(fft(stat_est));
spect_trans=abs(fft(tran_est));
env_spect_sig= estimate_env(spect_sig,[]);
env_spect_stat= estimate_env(spect_stat,[]);
env_spect_trans= estimate_env(spect_trans,[]);
figure;
plot(spect_sig);
hold on;
plot(env_spect_sig);
title('spectrum sig & sig spectrum env');
figure
hold on;
plot(spect_stat);
hold on;
plot(env_spect_stat);
title('spectrum stat & stat spectrum env');
figure
hold on;
plot(spect_trans);
hold on;
plot(env_spect_trans);
title('spectrum trans & tans spectrum env');
l_sp_trans=size(spect_trans,1);
randomcoeff=exp(2*pi*1i*rand(l_sp_trans/2+1,1));randomcoeff(1,1)=1;randomcoeff(l_sp_trans/2+1,1)=1;
randomphase=[conj(randomcoeff(1:1:l_sp_trans/2+1,1));randomcoeff(l_sp_trans/2:-1:2,1)]
size(randomphase)
l_sp_trans
synth_trans_spectrum=randomphase.*spect_trans;
%%%%%fs/2 ->n/2+1


   figure;
  
     spctr= fftshift(fft(tran_est));
     plot3(1:length(spctr),real(spctr),imag(spctr));
    title('"natural" transient spectrum');
    figure;
    spctr= fftshift(synth_trans_spectrum);
    plot3(1:length(spctr),real(spctr),imag(spctr));
    title('synthetic transient spectrum');
    synth_trans=ifft(synth_trans_spectrum);
 %synthetic_transient=wgn(1,length(env_trans),1)*env_trans;%modelization  of the fine struct of the transient by a noise, because of its chaotic behaviour
 %figure;
 %plot(synthetic_transient);
 %sound(synthetic_transient/10);