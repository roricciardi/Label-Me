Resumo
===
Este documento descreve as principais características do código label_me_classes desenvolvido para Matlab. O código tem como objetivo auxiliar na rotulação das imagens através de uma interface gráfica. O resultado da classificação manual é salvo em um arquivo csv.

Funcionalidade do código
===

O código label_me_classes tem como objetivo auxiliar na rotulação das imagens através de uma interface gráfica e salvar o resultado em um arquivo csv. Entre as funcionalidades do código estão:
Visualização da imagem a ser rotulada;
Atalhos para tornar a rotulação mais rápida;
Opção de associar mais de uma classe a uma imagem;
Visualização das classes associadas a uma imagem;
Opção de realizar a classificação em partes (não é necessário classificar todas as imagens de uma vez);
Opção de escolher as classes e as teclas de atalho associadas a elas.

Descrição do código
===
O código foi desenvolvido para funcionar no ambiente do Matlab e ele é composto de três arquivos:

label_me_classes.m;

getkey.m;

classes.csv.

1. label_me_classes.m

Este é o principal arquivo do código. Ele é responsável por ler as imagens, mostrar as imagens, rotuladas e armazenar os rótulos. Ele também incrementa a funcionalidade de permitir realizar a classificação em partes.
Inicialmente o código lê a lista de classes definidas pelo usuário. Esta lista está contida no arquivo classes.csv que está documentado abaixo. Depois, ele carrega a lista de imagens contidas no diretório apontado pelo Matlab. As extensões incluídas são: tiff, tif, bmp, jpg, jpeg e png. Arquivos com outras extensões são ignoradas pelo código.

Após estes procedimentos, as imagens são mostradas uma a uma para serem rotuladas. Para rotular as imagens são usadas as teclas do teclado, sendo estas definidas no arquivo classes.csv. As imagens podem ser rotuladas em mais de uma classe. Existem também algumas teclas especiais para realizar os comandos de avançar para a próxima imagem, sair do código e refazer a rotulação da imagem atual. Estes comandos são explicados na seção de Compilação e Execução.

A medida que as imagens são rotuladas, o resultado da classificação manual é armazenada num arquivo chamado imagens.csv. O padrão desse arquivo é descrito mais adiante. Uma vez que todas as imagens foram rotuladas, o programa fecha automaticamente. Uma nova tentativa de rodar o programa sobre as mesmas imagens gera a frase: “Todas as imagens já foram analisadas.”, e o programa volta a fechar.

Para controle do processo de classificação, o código é auxiliado por um arquivo criado em tempo de execução chamado last_point.mat. Este arquivo armazena as imagens encontradas na pasta, a última imagem que foi rotulada, se a classificação foi realizada para todas as imagens e as classes usadas para classificação, assim como as teclas de atalho. 

2. getkey.m

Código encontrado na comunidade do Matlab e desenvolvido por Jos van der Geest. Este código permite capturar as teclas do teclado e obter o código ASCII delas. Este arquivo é necessário para realizar a classificação das imagens.

3. classes.csv

O classes.csv informar as classes que serão usadas para rotular, assim como as teclas de atalho usadas para rotular. Este arquivo deve ser definido pelo usuário. O padrão dele é conforme o exemplo abaixo:

pessoas;p

multidao;m

cartazes;c

outros;o

bandeira;l

informativo;i

retrato;v

O primeiro dado é o nome da classe e após o ponto e vírgula (;) vem a tecla de atalho da classe. Repare que o arquivo não possui cabeçalho. Se, por exemplo, for rotular uma classe como pessoas, ao invés de digitar a palavra pessoas, é necessário somente teclar a tecla p. As teclas de atalho são case sensitive, ou seja, diferencia letras maiúsculas de minúsculas. Assim p é diferente de P. Para teclas de atalho podem ser usadas qualquer uma das teclas alfanuméricas (0, 1, ..., 9, a, b, ..., z, A, B, ..., Z), mas, para fácil identificação, é aconselhado usar uma letra relacionado ao nome da classe. Duas ou mais classes não podem ter a mesma tecla de atalho.

Compilação e Execução
===
O código não é compilado. Para executá-lo é necessário ter o Matlab instalado. Dois caminhos podem ser seguidos para executá-lo:

A forma geral:
Copiar os arquivos do código para a pasta work dentro do diretório do Matlab;
Abrir o Matlab e direcionar o diretório do Matlab para o local onde estão as imagens;
Executar o comando: label_me_classes no Matlab.

A forma específica:
Copiar os arquivos do código para a pasta onde estão as imagens;
Abrir o Matlab e direcionar o diretório do Matlab para o local onde estão as imagens;

Executar o comando: label_me_classes no Matlab.

A primeira opção é a melhor, pois é aplicável para qualquer pasta com imagens, enquanto na segunda opção é necessário copiar o arquivo para cada pasta de imagens.

Ao ser executado o comando, o Matlab abre imediatamente uma imagem para ser rotulada. Quando isso acontece, o usuário tem ao seu dispor as seguintes teclas de ação:

As teclas configuradas no arquivo classes.csv para rotular as imagens;

A tecla “Delete” que remove as classes associadas a imagem atual;

A tecla “Enter” que permite avançar para uma próxima imagem. Se não for associada nenhuma classe para a imagem, essa função é desabilitada.

A tecla “Esc” que fecha o programa sem salvar as classes da imagem atual.

As imagens continuam aparecendo até que todas acabem ou até a tecla “Esc” seja teclada.
A medida que a imagem vai sendo rotulada, o nome das classes vão aparecendo em cima da imagem. Na Figura 1 aparece uma imagem que foi rotulada nas classes moedas e torre:

Parâmetros de Entrada
======
O método precisa que o usuário defina o arquivo classes.csv (no padrão especificado anteriormente) e é necessário direcionar o diretório do Matlab para o diretório das imagens. Para executar o código é usado o comando label_me_classes.

Formato de Entrada
====
As entradas são imagens. Os formatos de imagens aceitos são: tiff, tif, bmp, jpg, jpeg e png. Outros formatos são ignorados pelo código. Outros formatos de imagens podem ser incluídos dentro da função label_me_classes no arquivo label_me_classes.m.

Formato de Saída
====
A saída do programa é um arquivo no formato csv chamado imagens.csv. Abaixo está um exemplo do formato desse arquivo:

id_imagem;conteudo

001.jpg;moedas;torre

002.jpg;pessoas

003.jpg;cartazes

004.jpg;publicidade

A primeira linha do arquivo é um cabeçalho. Nas linhas seguintes, o primeiro elemento é o nome da imagem e os demais elementos são as classes associadas à imagem. Os elementos são separados por ponto e vírgula (;). Por exemplo, a imagem 001.jpg foi associado as classes moedas e torre.

Limitações do Código
====
O código foi feito para funcionar com as imagens nos formatos: tiff, tif, bmp, jpg, jpeg e png. Imagens em outros formatos são ignoradas. No entanto, outros formatos podem ser adicionados na função label_me_classes incluída no arquivo label_me_classes.m, desde que não sejam limitadas pela capacidade do Matlab de abrir arquivos. O código foi feito na versão 7 do Matlab. Sem garantia de funcionamento em versões anteriores.
Outra limitação do código é a impossibilidade de alterar a quantidade de imagens ou editar o número de classes e o nome delas, uma vez que o código já tenha sido rodado dentro da pasta. Uma alternativa para contornar essa limitação é apagar os arquivos imagens.csv e last_point.mat, porém a classificação começará do zero novamente.

Contato
====
Dúvidas sobre o código podem ser tiradas com Patrick Marques Ciarelli através do e-mail de contato patrick_cstm@hotmail.com.
