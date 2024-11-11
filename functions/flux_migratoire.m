function flux_migratoire(terrain1, terrain2, display)
    %C'est encore une fonction d'affichage uniquement, elle établie un
    %bilan des flux migratoires durant l'étape de transition, elle n'a pas
    %un grand intêret théorique
    M = length(terrain1);
    info_terrain1 = zeros(M,6);
    info_terrain2 = zeros(M,6);

    for lieu = 1:M
        info_terrain1(lieu,:) = info_lieu(terrain1{lieu});
        info_terrain2(lieu,:) = info_lieu(terrain2{lieu});
    end

    flux = info_terrain1 - info_terrain2;
    
    columnNames = {'Lieu', 'Depart M', 'Depart F', 'Nb M', 'Nb F', 'Nb MM', 'Nb FM'};
    data = cell(length(terrain1), length(columnNames));
    
    for i = 1:length(terrain1)
        data{i, 1} = ['Lieu ', num2str(i)]; 
        data(i, 2:end) = {flux(i,1), flux(i,2), info_terrain2(i,1), info_terrain2(i,2), info_terrain2(i,4), info_terrain2(i,5)}; 
    end

    if display
        f = figure('Name', "Flux transitoire", 'NumberTitle', "off");
        uitable(f, 'Data', data, 'ColumnName', columnNames, 'Units', 'normalized', 'Position', [0.05 0.05 0.9 0.9]);
    end
end