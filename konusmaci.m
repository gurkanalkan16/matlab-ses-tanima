function result = konusmaci(Cikis)
    switch(Cikis)
        case 1
            result = "1";
        case 7
            result = "2";
        case 10
            result = "3";
        otherwise
          
            result = strcat("Konuşmacı ",string(Cikis));
    end
end