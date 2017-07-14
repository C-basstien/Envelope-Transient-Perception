    close all;
    %this script test the response to a dirac impulse 
    %for the smooth envellope process
    %to try to reduce the effect of windowing effect
    %that produce a kind of sinc effect in the ouput envelope
    
    
    %classical smooth with a cutoff at sample 1000 (frequency) 
    %(44,1Hz at fs=44,1kHz?)
    % and 10 iteration in the TAE process
    
    %This test show that so called window effect, and 'energy leaks' 
    %for different type of windows...
    
    %https://en.wikipedia.org/wiki/Window_function.
    %http://fr.mathworks.com/help/signal/ref/taylorwin.html
    
    sig=zeros(3000,1);sig(1500)=1;%'dirac'impulse 
    figure;   
    plot(abs(sig));
    hold on;
    env=smooth_temporal(sig,'Gaussian',10000,300);
    plot(env);
    hold on;
    env=smooth_temporal(sig,'Rectangular',1500,10);
    plot(env);
    
    %Gaussian, Hamming and others windows create a 'smoother'
    %result (no sinc oscilliation)
    %drawback: less accruate to the variation of the real envelope 
    %because their bandwith are larger....