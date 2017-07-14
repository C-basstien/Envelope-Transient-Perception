function sm_log_sp= smooth_spectrum(log_sp,window,cutoff,order)

% Based on  the True envellope approach of the following paper
% IMPROVED ESTIMATION OF THE AMPLITUDE ENVELOPE
% OF TIME-DOMAIN SIGNALS USING TRUE ENVELOPE CEPSTRAL SMOOTHING
% Marcelo Caetano, Xavier Rodet


%take log_sp log spectrum as argument
%return sm_log_sp the smooth log spectrum

% window: Hamming, Rectangular , Half-rec
% specify the way to lifter the spectrum
% leave empty for default configuation



% cutoff freq -() the smooth log spectrum
% leave empty for automatic set

% order specify the number of smooth iteration process
% to complete...
% leave empty for default configuation

% This function  smooth the log spectrun
% by applying a filtering in the cepstrum domain
l_xceps=length(log_sp);
w=zeros(l_xceps,1);
if(isempty(window))
    window='Rectangular';
end
if(isempty(cutoff))
    cutoff=round(l_xceps/1000);%parameters that ussually workfine
end
if(isempty(order))
    order=30;
end

switch window
    %becarfull to shift correctly the coeffs of the  filter
    %1:l_xceps/2 -> 0:f/2 
    %l_xceps:l_xceps/2 -> 0:-fs/2
    case 'Half-rec'% method used in the  paper
    w(1:cutoff-1 )=1;
    w(1:cutoff)=0.5;
    w(l_xceps:-1:l_xceps-cutoff+2)=1;
    w(l_xceps-cutoff+1)=0.5;
    case 'Rectangular'
    w(1:cutoff)=1;
    w(l_xceps:-1:l_xceps-cutoff+1)=1;
   
    case 'Gaussian'
    v=fftshift(gausswin(cutoff));
    w(1:cutoff/2+1)=v(1:cutoff/2+1);
    w(l_xceps:-1:l_xceps-cutoff/2+2)=v(cutoff:-1:cutoff/2+2);
    case 'Hamming'
    v=fftshift(hamming(cutoff));
    w(1:cutoff/2+1)=v(1:cutoff/2+1);
    w(l_xceps:-1:l_xceps-cutoff/2+2)=v(cutoff:-1:cutoff/2+2);
    case 'Blackman Harris'
    v=fftshift(blackmanharris(cutoff));
    w(1:cutoff/2+1)=v(1:cutoff/2+1);
    w(l_xceps:-1:l_xceps-cutoff/2+2)=v(cutoff:-1:cutoff/2+2);
    case 'Parzen'
    v=fftshift(parzenwin(cutoff));
    w(1:cutoff/2+1)=v(1:cutoff/2+1);
    w(l_xceps:-1:l_xceps-cutoff/2+2)=v(cutoff:-1:cutoff/2+2);   
end
C=log_sp;
for i= 1:order
    A=max(log_sp,C);
    cp=idft(A);
    C=real((dft(cp.*w)));
    %uncomment to see the intermediate result:
    %if(i<9 || i> 299)
    %plot((C));hold on;
    %end
end
sm_log_sp=C;
return 

