addpath('./functions');


%Données du problème
M = 10;
k = 50;
m = 0.8;
x = 0.5;
xstar = 0.1;
p_male = 0.5; %Proportion de mâle initiale
display = true; %Affichage des tableaux récapitulatifs de la population

terrain = cell(1, M);

for lieu = 1:M
    population = cell(1, k);
    
    for nem = 1:k
        if p_male > rand()
            population{nem} = {true, lieu == 1};
        else
            population{nem} = {false, lieu == 1};
        end
    end
    
    terrain{lieu} = population;
end


% Configuration initiale
info_globale(terrain, "Population initiale:", display);

% Transition
nouveau_terrain = transition(terrain, M, m);

% Configuration après la transition
info_t = info_globale(nouveau_terrain, "Information après Transition:", display);

% Flux migratoire
flux_migratoire(terrain, nouveau_terrain, display);

% Reproduction
repro = reproduction(nouveau_terrain, x, xstar, display);

% Configuration après un cycle
info_r = info_globale(repro, "Information après Reproduction:", display);

Wxx = (info_r(3) - info_t(3))/info_t(3);

Nb_tirage = 1; %Petit pour réduire le temps de calcul lors du chargement du fichier
list_W = zeros(Nb_tirage,1);
for i = 1:Nb_tirage
    terrain = cell(1, M);

    for lieu = 1:M
        population = cell(1, k);
    
        for nem = 1:k
            if p_male > rand()
                population{nem} = {true, lieu == 1};
            else
                population{nem} = {false, lieu == 1};
            end
        end
    
        terrain{lieu} = population;
    end
    etape1 = transition(terrain, M, m);
    info_t = info_globale(etape1, "", false);
    etape2 = reproduction(etape1, x, xstar, false);
    info_r = info_globale(etape2, "", false);

    list_W(i) = (info_r(3) - info_t(3))/info_t(3);
end
f = figure();
hist(list_W);
S = std(list_W);
m = mean(list_W);


S = 4.5478
m = 30.0391
borneinf = m - S/sqrt(300)*tinv(0.95,299)
bornesup = m + S/sqrt(300)*tinv(0.95,299)