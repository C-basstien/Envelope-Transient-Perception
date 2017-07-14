function env=smooth_temporal(sig,window,cutoff,order)
% Based on  the True envellope approach of the following paper
% IMPROVED ESTIMATION OF THE AMPLITUDE ENVELOPE
% OF TIME-DOMAIN SIGNALS USING TRUE ENVELOPE CEPSTRAL SMOOTHING
% Marcelo Caetano, Xavier Rodet


%take log_sp log spectrum as argument
%return sm_log_sp the smooth log spectrum

% window: Hamming, Rectangular , Half-rec
% specify the way to lifter the spectrum
% leave empty for default configuation

%Basicly it just apply smooth_spectrum to the signal...
%with a duplication  of the signal 
%before to mimic a spectrum signal
    l_x=length(sig);
    l_env=2.^(nextpow2(l_x));
    sig_temp=zeros(2*l_env,1);
    sig_temp(1:l_x)=abs(sig(l_x:-1:1));
    sig_temp(2*l_env-l_x+1:2*l_env)=abs(sig);
    %%%%mimic of a property spectrum signal%%%
    dbl_snth_env=smooth_spectrum(sig_temp,window,cutoff,order);
    env=dbl_snth_env(2*l_env-l_x+1:2*l_env);
    return