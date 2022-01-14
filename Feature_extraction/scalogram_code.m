clc
clear all
close all


%disease={'Pneumonia', 'Bronchiectasis', 'Bronchiolitis', 'URTI' , 'Healthy','URTI'};


for j=1:6
    imagefiles = dir(['train\',disease{j},'\*.wav']);
    nfiles = length(imagefiles)
   
    for i=1:nfiles
        t=0;
        Fs=8000;
        currentfilename=imagefiles(i).name
        f = fullfile('train\',disease{j},currentfilename)
        
        [y,F] = audioread(f);
        ys = resample(y,Fs,F);

        T=round(length(ys)/Fs)
        if T==0
            continue
        end
        t=linspace(0,T,length((ys)));
       
        Fs = 1/mean(diff(t));
        [cfs,f] = cwt(ys, Fs);

        im = ind2rgb(im2uint8(rescale(abs(cfs))),parula(128));
        f1 = fullfile('cwt\train\',disease{j},strcat(currentfilename,'perula.jpg'));
        imwrite(imresize(im,[224 224]),f1);

    end
end