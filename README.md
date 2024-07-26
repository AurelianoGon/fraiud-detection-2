# **Detecção de fraudes com Machine Learning Random Forest** 
Este projeto foi focado na detecção de fraudes em transações financeiras usando técnicas de **Machine Learning**. Com a crescente complexidade e sofisticação das atividades fraudulentas, é fundamental desenvolver sistemas inteligentes capazes de identificar padrões suspeitos e prevenir fraudes de forma eficaz.

## **Contexto**
A detecção de fraudes é uma área crucial em diversos setores. A capacidade de identificar transações fraudulentas de forma rápida e precisa é essencial para proteger os interesses dos clientes e das empresas.

## **Objetivo**
O objetivo deste projeto é desenvolver um modelo de Machine Learning capaz de analisar grandes volumes de dados de transações financeiras e identificar aquelas que são potencialmente fraudulentas. Utilizamos técnicas avançadas de processamento de dados e aprendizado de máquina para construir um sistema robusto e eficiente de detecção de fraudes.

## Dados
Os dados utilizados neste projeto consistem em um conjunto de transações financeiras rotuladas como fraudulentas ou legítimas. Cada transação é caracterizada por uma variedade de recursos, como valor, tipo de transação, entre outros. Estes dados foram pré-processados e transformados para serem utilizados como entrada para o modelo de Machine Learning no caso o **Random Forest**.

## Metodologia 
Análise Exploratória de Dados: Exploramos os dados para entender sua distribuição, identificar padrões e anomalias que possam indicar atividades fraudulentas.

Pré-processamento de Dados: Antes da construção de um modelo analítico, técnicas de engenharia são indispensáveis para a aquisição de conhecimento sobre o caso a resolver. Eeste momento é crucial para que o modelo apresente resultados satisfatórios. Para atingir esse objetivo, a princípio seis variáveis qualitativas foram transformadas em "FACTOR'. 
Essa transformação permite que o modelo trate essas variáveis de forma adequada, codificando-as como valores numéricos que representam diferentes categorias. Com isso, esperamos melhorar a precisão e a robustez das previsões do modelo, garantindo que ele capture corretamente a influência dessas variáveis qualitativas nos resultados finais.
Em seguida, três variáveis foram foram excluídas, pois ao analisá-las, verificou-se que elas não seriam necessárias para a construção do modelo. Na sequência, técnicas de remoção de valores ausentes, tratamento de dados 
duplicados e nulos, “outliers” foram aplicadas e  foi possível constatar que os dados estavam bem coletados e organizados. 

Logo depois, a atenção foi direcionada para algumas variáveis que não possuíam o formato adequado para a análise de um modelo supervisionado, por isso a técnica que 
representa dados categóricos como binários, conhecida como “one-hot encoding” foi aplicada para assegurar a representação numérica adequada. 
Dessa forma, as preditoras listadas abaixo foram submetidas a técnica referida para 
otimizar a resposta do modelo.
• entrega_doc_1;
• entrega_doc_2;
• entrega_doc_3.

## Análise Descritiva

- Após a realização de algumas etapas importantes do pré-processamento, iniciou-se uma análise descritiva com o objetivo de explorar e resumir as observações iniciais, a fim de compreender os padrões e características presentes nos dados. 
E para uma compreensão melhor dos dados, cada variável foi plotada.

![image](https://github.com/user-attachments/assets/e9177afd-0c37-4617-86a3-2f198fe66cf8)


- Verificou-se na variável (pais) que a liderança em compras foi do Brasil (BR) entre os 52 países que fazem parte do conjunto de dados, seguido pela Argentina (AR) e Uruguay (UY) em terceiro.

![image](https://github.com/user-attachments/assets/aaacfb3c-a85b-462a-bb73-a2d9428c5e30)

- Logo, na variável (valor_compra) observou-se que os valores das compras possuem um valor razoável, apresentando os máximos de R$ 100,00.

![image](https://github.com/user-attachments/assets/a78d4c42-e5a9-4b0d-a18c-05c9c783837c)


- Nesse Histograma é possível observar uma elevada concentração na pontuação 4 do score.A média da (score_1) é de 3.716 isso indica que as observações, no geral, possuem um “score” relativamente alto, pois o máximo é quatro.

![image](https://github.com/user-attachments/assets/f4401aee-3713-4b95-a3fc-ef2e77059d0f)

- No Histograma da Score 2 a média 0.7282 sugere que nessa variável a pontuação também é alta, com uma leve variação entre as observações, pois o máximo é 1.

![image](https://github.com/user-attachments/assets/f9ea77db-b6f5-4294-9f85-ccfb168cca62)

- Já na (score_3) em que a média é de 260.474 foi possível identificar uma alta variação dos valores nas observações, mostrando casos extremos de pontuação, variando de 0 a 13.878.744.

![image](https://github.com/user-attachments/assets/cb69a969-7aca-4072-952c-803000e79de2)

- Na (score_4) cuja média é de 21.76 foi possível verificar que a maioria das observações tem uma pontuação alta nessa preditora. 

![image](https://github.com/user-attachments/assets/446efc2a-c2ab-4dca-bcc0-bd82b09b72ff)

- Na (score_5) a média é de 0.2240 sendo que o mínimo é 0 e o máximo é 833.333, esse valor apresenta casos extremos de pontuação nas observações, indicando forte tendência dos resultados.

![image](https://github.com/user-attachments/assets/2858d2f3-0415-46e5-9aa2-6834134848c9)

- Na sequência, a (score_6) apresenta uma variedade de valores significativa, apresentando o mínimo de -5.00 e o máximo de 145.274.

![image](https://github.com/user-attachments/assets/38b5dae5-fc9a-47a8-bea5-2933040b6cd3)

- Já as variáveis (score_7) e (score_8) sugerem que as observações têm uma performance moderada.

![image](https://github.com/user-attachments/assets/fa6b4b1d-9d5e-4f2f-8526-8bf6c0ba2855)


![image](https://github.com/user-attachments/assets/2167abc9-aba6-4a0a-bbc7-ba3cf5104ef4)


- Por fim, as preditoras (score_9) e (score_10) exibem uma média relativamente alta, 2225 para os dois casos.

![image](https://github.com/user-attachments/assets/842b9a72-e034-4d4c-a230-533884111932)


![image](https://github.com/user-attachments/assets/9598999e-94e0-4bae-8314-ad5ad80e1504)

- Outro aspecto relevante desta análise foi a constatação de que apenas 0,04862% das transações foram identificadas como fraudulentas, ou seja, detectar as fraudes foi um desafio, de fato. Em razão disso, averiguou-se um desequilíbrio nos dados – uma situação comum nos 
eventos financeiros.


























Modelagem: Implementamos os algoritmos de Machine Learning: **Random Forest**, para construir o modelo de detecção de fraudes.

Avaliação e Otimização: Avaliamos o desempenho dos modelos usando métricas como precisão, recall e F1-score, curva ROC. Otimizamos os modelos para melhorar sua eficácia na detecção de fraudes.

## Resultados
O modelo desenvolvido demonstrou uma alta precisão e **acurácia** na detecção de fraudes, superando abordagens tradicionais e proporcionando uma significativa redução nas perdas financeiras devido a atividades fraudulentas. Ele é capaz de identificar padrões complexos e sutis que indicam potenciais transações fraudulentas, permitindo uma ação rápida e eficaz para mitigar riscos.


## Contribuição
Se você estiver interessado em contribuir para este projeto ou tiver feedback para compartilhar, sinta-se à vontade para abrir uma issue ou enviar um pull request. Estamos sempre abertos a colaborações e novas ideias para melhorar a detecção de fraudes e proteger os interesses dos usuários e empresas.

Vamos juntos combater fraudes e promover a segurança financeira!

