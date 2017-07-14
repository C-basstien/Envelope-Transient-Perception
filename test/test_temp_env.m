function test_temp_env()
    sig=audioread('glockenspiel.wav');% x -temporal signal   
    l_x=length(sig);
    l_env=2.^(nextpow2(l_x))
    env=zeros(2*l_env,1);
    env(1:l_x)=abs(sig(l_x:-1:1));
    env(2*l_env-l_x+1:2*l_env)=abs(sig);
    dbl_snth_env=smooth_spectrum(env,'Rectangular',1000,100);
    
    figure;
    plot(sig);
    hold on;
    plot(dbl_snth_env(2*l_env-l_x+1:2*l_env));
    %sound(sig)
    enveloppe=dbl_snth_env(2*l_env-l_x+1:2*l_env);
    fs=44100;
%     modulation=(sin(fs/2*(0:l_x-1)/l_x)+sin(fs*4*(0:l_x-1)/l_x)+sin(fs*3*(0:l_x-1)/l_x)+sin(fs*7*(0:l_x-1)/l_x)+sin(fs*8*(0:l_x-1)/l_x)++sin(fs*6*(0:l_x-1)/l_x))';
    %sound(modulation);
  %  newsound=modulation.*enveloppe;
    plot(enveloppe);hold on
    %sound(newsound);
%     plot(sig);
%     figure;
%     plot(abs(fft(sig)));hold on
%     plot(abs(fft(newsound)));
%     sound(newsound);
    