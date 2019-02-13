function Spectra_Wavelength(filename)

format long

x=xlsread(filename);

wavelengths=x(:,2)/10;
intensities=x(:,1);

Spectra_Wavelength_Macro(wavelengths,intensities)

end

