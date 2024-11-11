function nouveau_terrain = transition(terrain, M, m)
    %Toutes les fonctions renverront un nouvel ecosystème afin de pouvoir
    %facilement les comparer entre eux.
    nouveau_terrain = terrain;

    for lieu = 1:M
        k = length(terrain{lieu});
        
        %On parcourt les nématodes dans l'ordre décroissant pour éviter les
        %problèmes d'ordonnement
        for nem = k:-1:1
            %On prend un nématode
            nematode = nouveau_terrain{lieu}{nem};
            
            %Il va migrer avec la probabilité 1-m
            if rand() > m
                %La migration se fait de façon uniforme vers l'un des M-1
                %lieux
                indice_migration = randi([1, M - 1]);
                
                %Si le lieu choisi est celui sur lequel est le nématode, on
                %prend le lieu suivant
                if indice_migration == lieu
                    indice_migration = indice_migration + 1;
                end
                
                %On ajoute le nématode au nouveau lieu
                nouveau_terrain{indice_migration} = [nouveau_terrain{indice_migration}, {nematode}];
                %On le supprime de l'ancien lieu
                nouveau_terrain{lieu}{nem} = [];
            end
        end
    end
end