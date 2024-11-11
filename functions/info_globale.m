function info_global = info_globale(milieu, titre, display)
    %Comme la fonction info_lieu, cette fonction permet simplement
    %d'afficher un tableau récapitulatif de l'ecosystème
    M = length(milieu);

    columnNames = {'Lieu', 'Nombre male', 'Nombre femelle', 'Nb_mutant', 'Nb_MM', 'Nb_FM', 'Population'};
    data = cell(length(milieu)+1, length(columnNames));
    
    info_global = zeros(1,6);
    for i = 1:length(milieu)
        info = info_lieu(milieu{i});
        info_global = info_global + info;
        lieu_data = num2cell(info);
        data{i, 1} = ['Lieu ', num2str(i)]; 
        data(i, 2:end) = lieu_data; 
    end
    data{M+1,1} = ['Total '];
    data(M+1, 2:end) = num2cell(info_global);

    if display
        f = figure('Name', titre, 'NumberTitle', "off");
        uitable(f, 'Data', data, 'ColumnName', columnNames, 'Units', 'normalized', 'Position', [0.05 0.05 0.9 0.9]);
    end
end