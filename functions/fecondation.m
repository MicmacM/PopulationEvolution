function descendants = fecondation(nematode, k, reproducteur, x, xstar)
    %On gère ici la fecondation d'un nematode femelle. La definition du
    %sex_ratio utilise le fait qu'en Matlab, True = 1 et False = 0
    sex_ratio = xstar*nematode{2} + x*not(nematode{2});

    %On vérifie que le nématode est une femelle et qu'il y a des mâles sur le
    %lieu
    if not(nematode{1}) && reproducteur 
        %On remplit alors la liste des k descendants en leur donnant la
        %même ADN que leur mère, le sexe est choisi grâce au sex_ratio
        descendants = cell(1, k);
        
        for i = 1:k
            if rand() < sex_ratio
                descendants{i} = {true, nematode{2}};
            else
                descendants{i} = {false, nematode{2}};
            end
        end
    else
        descendants = {};
    end
end



