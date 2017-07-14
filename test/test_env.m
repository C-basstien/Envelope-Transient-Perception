    close all;
    sig=audioread('kmelo_sig.wav');% x -temporal signal 
    %sig=zeros(2000,1);sig(1000)=1;
    l_x=length(sig);
    l_env=2.^(nextpow2(l_x))
    env=zeros(2*l_env,1);
    env(1:l_x)=abs(sig(l_x:-1:1));
    env(2*l_env-l_x+1:2*l_env)=abs(sig);
    figure;   
    plot(abs(sig));
    hold on;
    dbl_snth_env=smooth_spectrum(env,'Rectangular',1000,300);
 
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    hold on;
    dbl_snth_env=smooth_spectrum(env,'Gaussian',10000,300);
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    hold on;
    dbl_snth_env=smooth_spectrum(env,'Hamming',10000,300);
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    hold on;
    dbl_snth_env=smooth_spectrum(env,'Blackman Harris',10000,300);
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    hold on;
    dbl_snth_env=smooth_spectrum(env,'Parzen',10000,300);
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    hold on;
    
%    figure;
%      spctr= fftshift(fft(sig));
%      plot3(1:length(spctr),real(spctr),imag(spctr))
%     hold on;
%     spctr= fftshift(fft(dbl_snth_env(2*l_env-l_x+1:2*l_env)));
%     plot3(1:length(spctr),real(spctr),imag(spctr))
     
%     xceps=idft(Xlog);
%     plot(xceps);
%     l_xceps=length(xceps); 
%     w=zeros(l_xceps,1);
%     smth_scale=10.^3
%     w(1:l_xceps/smth_scale)=1;
%     w(l_xceps:-1:l_xceps*(1-1/smth_scale))=1;
%     %w(10000)=0.5;
%     smoothsp=dft(w.*xceps);
%     figure;
%  %   plot(fftshift(abs(smoothsp))); 
%     plot(fftshift(Xlog));
%     hold on
%    % plot(fftshift(real(smoothsp)));
%     C=Xlog;
%     for i= 1:30
%     A=max(Xlog,C);    
%     cp=idft(A);
%     %C=real(dft(cp.*w));
%     C=real((dft(cp.*w)));
%     plot(fftshift(C));
%     
%     hold on
%     end
%     figure
%   w = hamming(10)
%   plot(ifftshift(w))
%   preci=100;
%          v=ifftshift(hamming(round(2*l_xceps/preci)));
%        w(1:l_xceps/preci)=v(1:l_xceps/preci);
%       length(w(l_xceps:-1:l_xceps*(1-1/preci)-1))
%       length(v(1+l_xceps/preci:2*l_xceps))
%       w(l_xceps:-1:l_xceps*(1-1-1/preci))=v(1+l_xceps/preci:2*l_xceps)
%     X=(log(abs(dft(sig))));
%     figure;
%     plot(fftshift(X));
%     xx=idft(fftshift(X));
%     figure;
%     plot(fftshift(xx));    
%     l_x=length(sig);
%     l_env=2.^(nextpow2(l_x))
%     env=zeros(2*l_env,1);
%     env(1:l_x)=abs(sig(l_x:-1:1));
%     env(2*l_env-l_x+1:2*l_env)=abs(sig);
%     %x=exp(env);
%     figure;
%     plot(env);
%     figure;
%     cp=zeros(2*l_env,1);
%     env=exp(env);
%     A=env;
%     C=A;
%     w=zeros(1,2*l_env);
%     w(l_env-1-nc:l_env+1+nc)=1;
%     w(l_env)=0.5;
%   for i= 1:2
%       A=max(env,C);
%       cp=fftshift(idft(A));
%       l_cp=length(cp)
%       nc=44100;
%        C=abs(dft(ifftshift(cp.*w)));
% 
%       for k=1:l_cp
%           C(k)=cp(k)*sum(w(1:2*l_env).*exp(-1i*2*pi*(k-1)*(0:2*l_env-1)./l_env));
%       end
%     
%   end
%     for i= 1:50
%     A=max(env,C);    
%     cp=fftshift(idft(A));
%     l_cp=length(cp)
%     nc=10;
%     cp(l_env-1:l_env-1-nc)=0;
%     cp(l_env)=cp(l_env)/2;
%     cp(l_env+1:l_env+1+nc)=0;
%     C=abs(dft(ifftshift(cp)));
%   end
%     plot(C);
%     figure;
%     plot(env);
%     figure;
%     plot(C);
%     x=1+sin(0:pi/8:8*pi);
%     y=abs(dft(x));
%     y_l=length(y)
%     plot(x);
%     figure;
%     k=
%     plot(k,y);
%     plot(y(x));
%     hold on 
%     plot(y_l/2,0,'b*');
%     