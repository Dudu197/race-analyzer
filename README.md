# Race Analyzer
## Analisador de corridas

![Imagem do Sistema](https://i.imgur.com/woX09ui.png)

--------

# A aplicação
A aplicação foi deseneolviva em **Ruby on Rails**.

A leitura dos dados é baseada em **upload de arquivo**, calculando os resultados na hora sem a ncessidade de banco de dados.

Apenas são aceitos arquivos **.txt**

Os arquivos devem seguir o padrão do arquivo exemplo abaixo:
```text
Hora                     Piloto               Nº Volta           Tempo Volta           Velocidade média da volta
20:16:03.277             001 – DUDU           1                   0:50.157             35,178
20:16:02.858             012 – MARCOS         1                   0:49.458             37,487
20:16:04.075             005 – LUAN           1                   0:51.478             34,245
20:16:01.075             007 – LYAN           1                   0:48.458             39,488
20:16:14.075             015 – LEOZIN         1                   1:01.789             30,487
20:16:51.277             001 – DUDU           2                   0:48.941             39,145
20:16:49.858             012 – MARCOS         2                   0:47.157             43,168
20:16:52.075             005 – LUAN           2                   0:48.759             40,178
20:16:48.075             007 – LYAN           2                   0:47.964             43,174
20:17:12.075             015 – LEOZIN         2                   0:58.245             33,164
20:17:40.277             001 – DUDU           3                   0:49.426             37,165
20:17:37.858             012 – MARCOS         3                   0:48.145             40,148
20:17:40.075             005 – LUAN           3                   0:48.135             40,487
20:17:35.075             007 – LYAN           3                   0:47.478             43,405
20:18:07.075             015 – LEOZIN         3                   0:55.125             34,048
20:18:28.277             001 – DUDU           4                   0:48.157             39,487
20:18:24.858             012 – MARCOS         4                   0:47.184             43,125
20:18:28.075             005 – LUAN           4                   0:48.178             40,254
20:18:22.075             007 – LYAN           4                   0:47.148             43,951
20:19:03.075             015 – LEOZIN         4                   0:56.149             34,102
```

Ou, deve seguir a seguinte **regex** (representando as respectivas colunas acima):
```
[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\.[0-9]{1,3}[ \t]{1,}[0-9]{1,}[ \t]{1,}.[ \t]{1,}[^ ]{1,}[ \t]{1,}[0-4][ \t]{1,}[0-9]{1,2}:[0-9]{1,2}\.[0-9]{1,3}[ \t]{1,}[0-9,\.]{1,}
``` 

# Testes
Foram desenvolvidos testes cobrindo os métodos dos *models*, garantindo que eles retornem os valores corretos.

Os testes foram desenvolvidos com **rspec** e com base de valores já calculados previamente e comparando seus resultados.

# Itens desenvolvidos
- [x] Resultado da corrida com as seguintes informações: **Posição Chegada**, **Código Piloto**, **Nome Piloto**, **Qtde Voltas Completadas** e **Tempo Total de Prova**.
- [x] Descobrir a melhor volta de cada piloto
- [x] Descobrir a melhor volta da corrida
- [x] Calcular a velocidade média de cada piloto durante toda corrida
- [x] Descobrir quanto tempo cada piloto chegou após o vencedor

# Feito com
- Ruby on Rails
- rspec
- ❤️