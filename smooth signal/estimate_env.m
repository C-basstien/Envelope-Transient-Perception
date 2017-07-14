function env= estimate_env(sig,method)
if(isempty(method))
    method='TAE';
end
%this function estimate the envelope of an undimensional signal
switch method%method use for the estimation
    case 'LPF'%low pass filtering
    
       
    case 'RMS'%root mean square 
        
        
    case 'FDLP'%frequency domain linear prediction
       
        
    case 'TAE'%true amplitude envelope estimation
    l_x=length(sig);
    l_env=2.^(nextpow2(l_x))
    dbl_sig=zeros(2*l_env,1);
    dbl_sig(1:l_x)=abs(sig(l_x:-1:1));
    dbl_sig(2*l_env-l_x+1:2*l_env)=abs(sig);
    dbl_snth_env=smooth_spectrum(dbl_sig,'Rectangular',100,50);
    env=dbl_snth_env(2*l_env-l_x+1:2*l_env);
    
end
return; 

    