function info = info_lieu(lieu)
    %C'est une simple fonction qui itère sur les nématodes et comptabilise
    %leurs types, elle n'a pas d'intêret théorique
    nb_male = 0;
    nb_femelle = 0;
    nb_mutant = 0;
    nb_male_mutant = 0;
    nb_femelle_mutante = 0;
    pop = numel(lieu);
    for nematode = 1:pop
        if not(isempty(lieu{nematode}))
            if lieu{nematode}{1}
                if lieu{nematode}{2}
                    nb_male_mutant = nb_male_mutant + 1;
                end
                nb_male = nb_male + 1;
            else
                if lieu{nematode}{2}
                    nb_femelle_mutante = nb_femelle_mutante + 1;
                end
                nb_femelle = nb_femelle + 1;
            end
        end
    end
    nb_mutant = nb_male_mutant + nb_femelle_mutante;
    info = [nb_male, nb_femelle, nb_mutant, nb_male_mutant, nb_femelle_mutante, pop];
end