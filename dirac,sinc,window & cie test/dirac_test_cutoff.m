    close all;
    %this script test the response to a dirac impulse 
    %for the smooth envellope process
    %to try to reduce the effect of windowing effect
    %that produce a kind of sinc effect in the ouput envelope
    
    
    %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
    % and 10 iteration in the TAE process
    
    %This test show that so called window effect, and 'energy leaks' 
    %when the cutoff frequency  get lower
    %this can be easly verify by a theorical approach.
    
    sig=zeros(3000,1);sig(1500)=1;%'dirac'impulse 
    figure;   
    plot(abs(sig));
    hold on;
    env=smooth_temporal(sig,'Rectangular',1,10);
    plot(env);
    hold on;
    env=smooth_temporal(sig,'Rectangular',10,10);
    plot(env);
    hold on;
    env=smooth_temporal(sig,'Rectangular',100,10);
    plot(env);
    hold on;
    env=smooth_temporal(sig,'Rectangular',1000,10);
    plot(env);
    hold on;
    env=smooth_temporal(sig,'Rectangular',1300,10);
    plot(env);