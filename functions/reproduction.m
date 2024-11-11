function middle = reproduction(milieu, x, xstar, display)
    total_fecondee = 0;
    M = numel(milieu);
    middle = milieu
    
    columnNames = {'Lieu', 'F Fecondées', 'FM Fécondées'};
    data = cell(length(milieu)+1, length(columnNames));

    %Effectuons la reproduction lieu par lieu
    for lieu_id = 1:M   
        %On récupère le nombre de nématode dans le lieu
        info = info_lieu(middle{lieu_id});
        
        k = info(6);

        %On vérifie qu'il y a des mâles dans le lieu pour que la
        %reproduction soit possible
        reproducteur = info(1) > 0;

        nb_femelle_fecondee = 0;
        nb_femelle_mutante_fecondee = 0;
        

        for nem = 1:length(middle{lieu_id})
            if not(isempty(middle{lieu_id}{nem}))

                %On prend une nématode dans le lieu
                nematode = middle{lieu_id}{nem};

                %On obtient la liste (eventuellement vide) de ses
                %descendants
                descendants = fecondation(nematode, k, reproducteur, x, xstar);
                
                %Si il y a eu des descendants, on met à jour les compteurs
                if ~isempty(descendants)
                    nb_femelle_fecondee = nb_femelle_fecondee + 1;
                
                    if nematode{2}
                        nb_femelle_mutante_fecondee = nb_femelle_mutante_fecondee + 1;
                    end
                end
            %Enfin on met ajoute les descendants au lieu
            middle{lieu_id} = [middle{lieu_id}, descendants];
            end
        end
        
        total_fecondee = total_fecondee + nb_femelle_mutante_fecondee;
        data{lieu_id, 1} = ['Lieu ', num2str(lieu_id)]; 
        data(lieu_id, 2:end) = {nb_femelle_fecondee, nb_femelle_mutante_fecondee};
    end
    

    data{M+1,1} = ['Total '];
    data{M+1, 3} = [total_fecondee];
    
    if display
        f = figure('Name', "Résultat de la fécondation", 'NumberTitle', "off");
        uitable(f, 'Data', data, 'ColumnName', columnNames, 'Units', 'normalized', 'Position', [0.05 0.05 0.9 0.9]);
    end
end