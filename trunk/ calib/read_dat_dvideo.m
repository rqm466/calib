function L=read_dat_dvideo(nome_arq)
%Esta fun��o converte do formato do dvideo para o formato usado na funcao
%calibra. Ainda cont�m -1 na sa�da.
%Entrada: Nome do arquivo .dat
%Saida: Vetor Nx2 com os pontos da imagem 

%ler o arquivo .dat
buf=textread(nome_arq);

%vamos excluir o primeiro n�mero (nao sei para que serve!)
buf=buf(:,2:end);
tam=size(buf,2);
buf(buf==-1)=nan;
unico=nanmean(buf,1);
unico(isnan(unico))=-1;

%Alocar mem�ria para a sa�da
il=1;
for i=1:2:tam
    L(il,:)=[unico(i) unico(i+1)];
    il=il+1;
end
     
    