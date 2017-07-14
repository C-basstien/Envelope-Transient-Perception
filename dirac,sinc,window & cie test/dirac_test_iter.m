    close all;
    %this script test the response to a dirac impulse 
    %for the smooth envellope process
    %to try to reduce the effect of windowing effect
    %that produce a kind of sinc effect in the ouput envelope
    
    
    %This test show that the sinc effect level not depent 
    %of TAE iteration process 
    %this can be easly verify by a theorical approach of TAE.
    

    %%%%TEST1%%%%
    
    %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
    % and 300 iteration in the TAE process
    sig=zeros(3000,1);sig(1500)=1;%'dirac'impulse 
    figure;   
    plot(abs(sig));
    hold on;
    env=smooth_temporal(sig,'Rectangular',1000,300);
    plot(env);
    
%     %just for .... fun !
%     plot3dspectrum(sig)
%     plot3dspectrum(env)
    
  
     %%%%TEST2%%%%
     
      %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
     % and 50 iteration in the TAE process
    hold on;
    env=smooth_temporal(sig,'Rectangular',1000,50);
    plot(env);
    

     %%%%TEST3%%%%

     %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
     % and 10 iteration in the TAE process;
    hold on;
    env=smooth_temporal(sig,'Rectangular',1000,10);
    plot(env);
    
   %%%%TEST4%%%%

     %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
     % and 1 iteration in the TAE process
    hold on;
    env=smooth_temporal(sig,'Rectangular',1000,10);
    plot(env);
    
%==> iteration no effect on the sinc effect level   
    

