 function label_me_classes

%Carrega arquivo save, se não existir cria um
if isempty(ls('last_point.mat'))    

    [classes,letras] = textread('classes.csv','%s%c%*[^\n]','delimiter',';'); %arquivos com as classes
    letras = double(letras);
    
    fp = fopen('imagens.csv','w');
    fwrite(fp, sprintf('id_imagem;conteudo\r\n'));
    fclose(fp);

    files{1} = ls('*.jpg');
    files{2} = ls('*.bmp');
    files{3} = ls('*.png');
    files{4} = ls('*.tiff');
    files{5} = ls('*.jpeg');
    files{6} = ls('*.tif');
    j_ini = 1;
    i_ini = [1 1 1 1 1 1];
    finish = 0;
    
    save last_point files j_ini i_ini finish classes letras

else
   load last_point 
end

%ainda não terminou
if finish == 0

    J_I = j_ini;
    I_I = i_ini;
    sair = 0;

    for j = J_I:6
        for i = I_I(j):size((files{j}),1)
        
            %salva ultima imagem analisada
            j_ini = j;
            i_ini(j) = i;
            save last_point files j_ini i_ini finish classes letras
    
            flag = zeros(1,size(classes,1));
    
            I = imread(files{j}(i,:));
            imshow(I);
    
            conteudo = '';
            
            %ler teclado
            while 1
                
                key = getkey;   
                
                if key == 127 %tecla del  %desfaz marcação
                    flag = zeros(1,size(classes,1));
                    conteudo = '';
                    title(conteudo);
                    continue;
                end
                        
                        
                %muda de imagem 
                if key == 13 %tecla Enter
                    if strcmp(conteudo,'')
                        warning('Foi selecionada nenhuma categoria.');
                    else
                        break;
                    end
                end
            
                %sai do programa
                if key == 27 %tecla ESC
                    sair = 1;
                    break;
                end

                
                %rotulos para a imagem
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                Index = find(letras == key);
                if isempty(Index)
                    continue;
                    
                else
                    if flag(Index) == 0
                        conteudo = strcat(conteudo,classes{Index},';');
                        title(conteudo(1:end-1),'FontSize',16);
                        flag(Index) = 1;
                    end
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
        
            if sair == 0
        
                conteudo = conteudo(1:end-1);
            
                %salva arquivo CSV
                fp = fopen('imagens.csv','a');
                fwrite(fp, sprintf('%s;%s\r\n',files{j}(i,:),conteudo));
                fclose(fp);
            
            else
                break; 
            end
        
        end
    
        if sair == 1
            break;
        end
   
    end

    if sair == 0
        finish = 1;
        %salva mudanca
        save last_point files j_ini i_ini finish classes letras
    end
    
    close all
    
else %todas as imagens foram analisadas
    display('Todas as imagens já foram analisadas.');
end

