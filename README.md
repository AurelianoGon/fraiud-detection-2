# **Detecção de fraudes com Machine Learning Random Forest** 
Este projeto foi focado na detecção de fraudes em transações financeiras usando técnicas de **Machine Learning**.
Com a crescente complexidade e sofisticação das atividades fraudulentas, é fundamental desenvolver sistemas inteligentes capazes de identificar padrões suspeitos e prevenir fraudes de forma eficaz.

## **Contexto**
A detecção de fraudes é uma área crucial em diversos setores. A capacidade de identificar transações fraudulentas de forma rápida e precisa é essencial para proteger os interesses dos clientes e das empresas.

## **Objetivo**
O objetivo deste projeto é desenvolver um modelo de **Machine Learning** capaz de analisar grandes volumes de dados de transações financeiras e identificar aquelas que são potencialmente fraudulentas. Utilizamos técnicas avançadas de processamento de dados e aprendizado de máquina para construir um sistema robusto e eficiente de detecção de fraudes.

## Dados
Os dados utilizados neste projeto consistem em um conjunto de transações financeiras rotuladas como fraudulentas ou legítimas. Cada transação é caracterizada por uma variedade de recursos, como valor, tipo de transação, entre outros. Estes dados foram pré-processados e transformados para serem utilizados como entrada para o modelo de Machine Learning no caso o **Random Forest**.

## Metodologia 
**Análise Exploratória de Dados:** Exploramos os dados para entender sua distribuição, identificar padrões e anomalias que possam indicar atividades fraudulentas.

**Pré-processamento:** Antes da construção de um modelo analítico, técnicas de engenharia são indispensáveis para a aquisição de conhecimento sobre o caso a resolver. Este momento é crucial para que o modelo apresente resultados satisfatórios. Para atingir esse objetivo, a princípio seis variáveis qualitativas foram transformadas em "FACTOR". 

Essa transformação permite que o modelo trate essas variáveis de forma adequada, codificando-as como valores numéricos que representam diferentes categorias. Com isso, esperamos melhorar a precisão e a robustez das previsões do modelo, garantindo que ele capture corretamente a influência dessas variáveis qualitativas nos resultados finais.

Em seguida, duas variáveis foram excluídas, pois ao analisá-las, verificou-se que elas não seriam necessárias para a construção do modelo. Na sequência, técnicas de remoção de valores ausentes, tratamento de dados duplicados e nulos, “outliers” foram aplicadas e foi possível constatar que os dados estavam bem coletados e organizados. 

Logo depois, a atenção foi direcionada para algumas variáveis que não possuíam o formato adequado para a análise de um modelo supervisionado, por isso a técnica que representa dados categóricos como binários, conhecida como “one-hot encoding” foi aplicada para assegurar a representação numérica adequada. 
Dessa forma, as preditoras listadas abaixo foram submetidas a técnica referida para otimizar a resposta do modelo.

• entrega_doc_1;

• entrega_doc_2;

• entrega_doc_3.

-------
## Análise Descritiva

Após a realização de algumas etapas importantes do pré-processamento, iniciou-se uma análise descritiva com o objetivo de explorar e resumir as observações iniciais, a fim de compreender os padrões e características presentes nos dados. 
E para uma compreensão melhor dos dados.

![image](https://github.com/user-attachments/assets/e9177afd-0c37-4617-86a3-2f198fe66cf8)
----

Ao analisarmos as variáveis, observou-se algumas informações importantes e abaixo seguem os detalhes/insights das análises:

- A média da (score_1) é de 3.716 isso indica que as observações, no geral, possuem um “score” relativamente alto, pois o máximo é quatro. 

- Na (score_2) a média 0.7282 sugere que nessa variável a pontuação também é alta, com uma leve variação entre as observações, pois o máximo é 1. 

- Já na (score_3) em que a média é de 260.474 foi possível identificar uma alta variação dos valores nas observações, mostrando casos extremos de pontuação, variando de 0 13.878.744. 

- Na (score_4) cuja média é de 21.76 foi possível verificar que a maioria das observações tem uma pontuação alta nessa preditora.

- A  (score_5) apresenta uma média é de 0.2240 sendo que o mínimo é 0 e o máximo é 833.333, esse valor apresenta casos extremos de pontuação nas observações, indicando forte tendência dos resultados.
  
- Na sequência, a(score_6) apresenta uma variedade de valores significativa, apresentando o mínimo de -5.00 e o máximo de 145.274.
  
- Já a variável (score_7) e (score_8) sugerem que as observações têm uma performance moderada.

- E por fim, as preditoras (score_9) e (score_10) exibemuma média relativamente alta, 2225 para os dois casos.
------------------

### Apresentamos a seguir os gráficos para a análise dos comentários mencionados acima:

![image](https://github.com/user-attachments/assets/f4401aee-3713-4b95-a3fc-ef2e77059d0f)

-----
![image](https://github.com/user-attachments/assets/f9ea77db-b6f5-4294-9f85-ccfb168cca62)

-----

![image](https://github.com/user-attachments/assets/cb69a969-7aca-4072-952c-803000e79de2)

----- 

![image](https://github.com/user-attachments/assets/446efc2a-c2ab-4dca-bcc0-bd82b09b72ff)

------

![image](https://github.com/user-attachments/assets/2858d2f3-0415-46e5-9aa2-6834134848c9)

------

![image](https://github.com/user-attachments/assets/38b5dae5-fc9a-47a8-bea5-2933040b6cd3)

---------

![image](https://github.com/user-attachments/assets/fa6b4b1d-9d5e-4f2f-8526-8bf6c0ba2855)

------

![image](https://github.com/user-attachments/assets/2167abc9-aba6-4a0a-bbc7-ba3cf5104ef4)

---------

![image](https://github.com/user-attachments/assets/842b9a72-e034-4d4c-a230-533884111932)

--------------

![image](https://github.com/user-attachments/assets/9598999e-94e0-4bae-8314-ad5ad80e1504)

------

Após analisar as variáveis (score), foram realizadas análises de outras variáveis, como país, e constatou-se que o Brasil (BR) liderou as compras entre os 52 países do conjunto de dados, seguido pela Argentina (AR) em segundo lugar e pelo Uruguai (UY) em terceiro.

![image](https://github.com/user-attachments/assets/3336fce8-6fab-4a1f-8654-639921d46088)
-----
Logo, na variável (valor_compra) observou-se que os valores das compras possuem um valor razoável, apresentando os máximos de R$ 100,00.

![image](https://github.com/user-attachments/assets/a78d4c42-e5a9-4b0d-a18c-05c9c783837c)

------

Outro aspecto relevante desta análise foi a constatação de que apenas 0,04862% das transações foram identificadas como fraudulentas, ou seja, detectar as fraudes foi um desafio, de fato.

![image](https://github.com/user-attachments/assets/01967d18-af71-43f1-999a-0efebdb47180)

-------

Em razão disso, averiguou-se um desequilíbrio nos dados – uma situação comum nos eventos financeiros. Diante do exposto, identificou-se a necessidade de realizar um balanceamento e a técnica **“Random Undersampling”** foi aplicada, a fim de balancear o conjunto de dados para uma melhor performance e resultado.

![image](https://github.com/user-attachments/assets/0e957899-2a51-4549-a427-cadca97c7fb6)

Logo, aplicou-se a técnica conhecida como validação cruzada ou **“cross-validation”**. Essa técnica segmenta o conjunto de dados em partes, além de avaliar a capacidade de generalização em dados não vistos. É necessário reter alguns dados dos quais se sabe o valor da variável alvo, mas que não serão usados para construir o modelo, esses, não são os dados reais de uso, e no final se deseja prever o valor da variável alvo.

O foco é que o modelo possua uma taxa de acerto alta e constante tanto nos dados de treino quanto nos dados de teste. Nesse sentido, a divisão ocorreu da seguinte forma:  

- 80% para dados de treino (set de treino);

- 20% para dados de teste (set de teste).
   
Após a partição do banco de dados, seguem os resultados:

•	treino: 208080;

•	teste: 71385.

Ainda no cenário de ajustar/manipular o conjunto de dados para otimizar a predição, a busca por hiperparâmetros foi realizada de duas maneiras: manual e automatizada. Na abordagem automatizada, aplicou-se a técnica “Grid Search”. 
Porém, vale esclarecer que mesmo diante dos resultados relevantes dos hiperparâmetros obtidos automaticamente, não foi possível aplicar todos na construção do modelo, devido às limitações da máquina. 

Ao executar o modelo, a princípio, verificou-se quais variáveis foram relevantes em todas as 200 combinações. Os detalhes desse resultado estão representados graficamente abaixo.

![image](https://github.com/user-attachments/assets/b583d552-5621-40db-9caf-d50636547b91)

Neste contexto, é importante salientar que a avaliação da relevância das preditoras possui diferentes abordagens, então aplicar outras técnicas é considerada uma boa prática. A Figura abaixo mostra o comportamento das preditoras através de outra técnica.

![image](https://github.com/user-attachments/assets/0cd1c97b-b051-4c37-9130-e6d50801334d)

Esta técnica apresenta a ordem de importância das preditoras, além de medir a contribuição média de cada preditora. Foi possível verificar que as disparidades em relação a outra técnica não foram tão significativas. Ao plotar o modelo “Random Forest”, constatou-se que ele apresentou ótimo desempenho neste contexto.

![image](https://github.com/user-attachments/assets/81d22528-294a-47ed-82a7-e1585080568d)

A linha preta indica a quantidade de erros nas amostras de “Out-of-Bag” [OOB], enquanto a linha verde exibe a taxa de erro na classe 1 (fraude) e na linha vermelha é possível verificar a taxa de erro da classe 0 (não-fraude). Pode-se identificar que por volta da 50ª árvore, o erro se estabiliza.	

Com o objetivo de realizar uma análise detalhada do resultado da **Floresta Aleatória**, outras métricas de avaliação foram verificadas. As métricas a seguir, indicam o desempenho geral do modelo:

•	taxa de erro OOB “Out-of-Bag” foi de 0,7%. Essa estimativa ocorre quando o modelo é aplicado a dados não usados durante o treinamento, em outras palavras, indica o quão bem o algoritmo deve sair em dados não vistos;

Diante dos resultados da matriz de confusão, é possível avaliar a performance do modelo, logo 102.576 instâncias foram classificadas corretamente para a classe 0, enquanto 1.464 instâncias foram classificadas incorretamente para a classe 1. 

Na segunda linha, não houve instâncias classificadas incorretamente para a classe 1, em contrapartida, todas as 104040 instâncias foram corretamente classificadas como 1. 
Os resultados mostram que o modelo teve um elevado desempenho nas classificações.  

**Métricas avaliativas obtidas na base de teste:**
- Sensibilidade: 1
- Especificidade: 0,98
- Acurácia: 0,99

Diante dos resultados, decidiu-se avaliar a métrica F1-score, que também apresentou o valor de 0.99. Isso significa que o modelo conseguiu alcançar equilíbrio desejável entre precisão e revocação. Na prática, isso significa que o algoritmo classificou corretamente as transações fraudulentas. 

Vale ressaltar, que as métricas se apresentaram elevadas, o que é raro em contextos de dados, em especial de aprendizado de máquinas. É preciso levar em conta a complexidade dos dados reais tais como: ruídos, erros, variações, limitações de algoritmos e computacionais entre outros fatores.  Embora seja possível alcançar valores perfeitos em cenários ideais, como ocorre nesse caso, em que o banco de dados foi alterado para este fim. 

Logo, o banco de dados usado neste estudo, possui natureza semissintética, pois foi modificado em razão da segurança/privacidade e para fim de teste e avaliação do desempenho de modelos de “Machine Learning”.

Em última análise, o modelo apresentou uma elevada acurácia, sensibilidade e especificidade, indicando bom desempenho de detecção. Em outras palavras o modelo forneceu excelentes resultados no conjunto de dados semissintéticos. 
A fim de oferecer mais uma avaliação integral sobre o desempenho do modelo, a curva ROC foi utilizada como uma métrica de desempenho da base de teste.

![image](https://github.com/user-attachments/assets/40a2e172-1a22-497e-9231-07619d3bf602)

Levando em conta as avaliações realizadas, é possível afirmar que o modelo apresentou um desempenho favorável, com altos valores em todos os testes realizados. Esse resultado positivo pode ser atribuído: à eficácia do modelo “Random Forest” em cenários como esse, a uma cuidadosa coleta e organização dos dados com ênfase nas variáveis, a aplicação dos procedimentos e técnicas relevantes do pré-processamento e a influência da natureza semissintética do banco de dados.

Porém, uma incerteza persiste: se o modelo fosse treinado com a quantidade de árvores sugeridas pela técnica “Grid Search” os resultados seriam os mesmos? Sabe-se que quanto maior o número de árvores, mais poder de generalização terá o modelo.

Por outro lado, aumenta a complexidade computacional que foi o caso deste trabalho. Testes com 100, 150 e 200 árvores foram executados e todos tiveram resultados idênticos.
Infelizmente, os testes com 1000 e 2000 árvores que eram o foco inicial deste trabalho, não foram possíveis conforme o mencionado: limitação da máquina.

----

## Resultados
**O modelo desenvolvido demonstrou uma alta precisão e **acurácia** na detecção de fraudes, superando abordagens tradicionais e proporcionando uma significativa redução nas perdas financeiras devido a atividades fraudulentas. Ele é capaz de identificar padrões complexos e sutis que indicam potenciais transações fraudulentas, permitindo uma ação rápida e eficaz para mitigar riscos.**

--- 

## Contribuições 

Dada a alta performance deste modelo no banco de dados em questão, sugere-se a continuação deste estudo, explorando as seguintes áreas: otimização dos hiperparâmetros, pois isso pode influenciar nos resultados obtidos, realizar comparações com outros algoritmos como Redes Neurais, “Support Vector Machines”, “Gradiente Boosting” entre outros. Além de avaliá-los em bancos de dados bem consolidado, utilizando máquinas mais poderosas que suportem os hiperparâmetros esperados e todos os atributos que compõem o conjunto de dados, evitando quaisquer divagações na qualidade dos dados.

Portanto, é possível aprimorar as descobertas deste trabalho, dando vez para avanços adicionais que poderão enriquecer de maneira positiva futuros estudos nessa área. O estudo contínuo é essencial para o progresso e inovação do tema em questão.

Se você estiver interessado em contribuir para este projeto ou tiver feedback para compartilhar, sinta-se à vontade para abrir uma issue ou enviar um pull request. Estamos sempre abertos a colaborações e novas ideias para melhorar a detecção de fraudes e proteger os interesses dos usuários e empresas.

Vamos juntos combater fraudes e promover a segurança financeira!

Brunna Aureliano

Contato:

brunnamian@gmail.com

