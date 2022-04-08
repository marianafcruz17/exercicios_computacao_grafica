function img_original = gama(path_img_original)

img_original = imread(path_img_original);

img_original = double(img_original)/255;

tam = size(img_original);
[lin, col] = size(img_original);
fprintf('Linhas: %d | Colunas %d\n', lin, col);

if length(tam) ~= 3
  display('A variavel de entrada não é uma imagem no espaço RGB');
end

img_cinza = rgb2gray(img_original);

mean_intensity_cinza = mean(img_cinza(:));
fprintf('Média de intensidade de pixels: %d\n', mean_intensity_cinza);

if mean_intensity_cinza < 0.5
  
  img_claro = img_cinza.^(0.6);
  
  display('Imagem escura, vamos clarear!')
  mean_intensity_claro = mean(img_claro(:));
  fprintf('Média de intensidade de pixels enclarear: %d\n', mean_intensity_claro);
  
  figure;
  subplot(1, 2, 1); imshow(img_cinza);
  title('Imagem binária'); 
  subplot(1, 2, 2); imshow(img_claro);
  title('Imagem enclarecida');


else
  img_escura = img_cinza.^(1.5);

  display('Imagem clara, vamos escurecer')
  mean_intensity_escuro = mean(img_escura(:));
  fprintf('Média de intensidade de pixels após escurecer: %d\n', mean_intensity_escuro);
  
  figure;
  subplot(1, 2, 1); imshow(img_cinza);
  title('Imagem binária'); 
  subplot(1, 2, 2); imshow(img_escura);
  title('Imagem escurecida');
end
