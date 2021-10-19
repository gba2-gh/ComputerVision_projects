function m_c = momento_central(image, p, q)
%% Calcular Componentes del centroide
m10 = momento(image,1,0); 
m01 = momento(image,0,1);
m00 = momento(image,0,0);

%%Calcular Centroide
x_c = m10/m00;
y_c = m01/m00;


%%Momento central
m_c=0;
[h, w] = size(image);
for x=1:h 
    for y=1:w
        m_c = m_c + (((x-x_c)^p) * ((y-y_c)^q) * image(x,y));  %%Ecuacion del momento central
    end
end




