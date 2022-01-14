disease={'Bronchiectasis' 'Bronchiolitis' 'Healthy' 'LRTI' 'Pneumonia' 'URTI'};


for j=1:6
    imagefiles = dir(['F:\machine_learning\output\',disease{j},'\*.wav']);
    nfiles = length(imagefiles)
    
    
    for i=1:2
        currentfilename=imagefiles(i).name
        f = fullfile('F:\machine_learning\output\',disease{j},currentfilename)
        [y,Fs] = audioread(f);
        [imf,residual] = emd(y);
        coeff=0;
        for k=1:length(imf(1,:))
            z=corrcoef(y,imf(:,k));
            coeff(k)=z(2);
        end
        [val, idx]=max(coeff);
        idvalue(j,i)=idx
    end
end