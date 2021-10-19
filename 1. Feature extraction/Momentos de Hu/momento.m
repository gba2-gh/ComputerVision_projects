%momentos
function m = momento(image,p,q)
[h, w] = size(image);
m=0;
for x=1:h 
    for y=1:w
        m = m + x^p*x^q*image(x,y); %%Ecuacion del momento
    end
end