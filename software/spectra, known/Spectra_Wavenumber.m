function Spectra_Wavenumber(filename)

format long

x=xlsread(filename);

wavelengths=x(:,2)/10;
for i=1:length(wavelengths)
    wavelengths(i)=10^7/wavelengths(i);
end
intensities=x(:,1);

Spectra_Wavenumber_Macro(wavelengths,intensities)

end

