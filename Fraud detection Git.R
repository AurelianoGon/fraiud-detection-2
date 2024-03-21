pacotes <- c("ipred",
             "rpart.plot",
             "rpart",
             "dplyr",
             "caTools",
             "randomForest",
             "ggplot2",
             "reshape2",
             "fastDummies",
             "caret",
             "gbm" ,
             "janitor" ,
             "ROSE",
             "ggcorrplot",
             "themis",
             "DataEditR",
             "fastDummies",
             "ggpubr",
             "caret",
             "dummy",
             "vip" ,
             "xgboost")

if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for(i in 1:length(instalador)) {
    install.packages(instalador, dependencies = T)
    break()}
  sapply(pacotes, require, character = T) 
} else {
  sapply(pacotes, require, character = T) }

fraudes <- read.csv(file = 'dados2.csv')

set.seed(157)

# Excluir variável
fraudes$produto <- NULL
fraudes$categoria_produto <- NULL
fraudes$score_fraude_modelo <- NULL

## Transformar a variável QUALITATIVA em factor
fraudes$pais <- as.factor(fraudes$pais)
fraudes$fraude <- as.factor(fraudes$fraude)
fraudes$entrega_doc_2 <- as.factor(fraudes$entrega_doc_2)
fraudes$entrega_doc_3 <- as.factor(fraudes$entrega_doc_3)
fraudes$entrega_doc_1 <- as.factor(fraudes$entrega_doc_1)
fraudes$data_compra <- as.Date(fraudes$data_compra)

fraudes %>% ggplot(aes(x = fraude)) + geom_bar(stat = "count", fill = "darkgrey")

###########################################################################

# Este é importante para ver detalhes do dataset 
str(fraudes)
View(fraudes)

# Extair registros exclusivos de uma variável 
unique(fraudes$pais)
unique(fraudes$valor_compra)

# Para obter detalhes da variável
table(fraudes$pais)
table(fraudes$fraude)

############ Limpeza do Dataset para tratar missing values###############

#localizando a presença de valores missing no dataframe

sapply(fraudes, function(x) which(is.na(x)))

# contando a quantidade de valores missing no dataframe
sapply(fraudes, function(x) sum(is.na(x)))

# dados duplicados 
get_dupes(fraudes)

fraudes %>% get_dupes(score_1, score_2, score_3, score_4, score_5, score_6, 
                      score_7, score_8, score_9, score_10)

fraudes %>% get_dupes (pais, entrega_doc_1, 
                       entrega_doc_2, entrega_doc_3)

fraudes %>% get_dupes (data_compra, valor_compra,fraude)


# dados nulos 
fraudes <-  na.omit(fraudes)
fraudes

#Dados faltantes ele mostra quantos faltam
colSums(is.na(fraudes))
colSums(fraudes =="")

########### Transformar variáveis categóricas em dummies
fraudes_dummy <- dummy_columns(.data = fraudes,
                               select_columns = c('entrega_doc_2','entrega_doc_3'),
                               remove_selected_columns = T,
                               remove_first_dummy = T)


#########  Análise descritiva ###################
summary(fraudes_dummy)
glimpse(fraudes)

## Balanceamento doa dataset, pois a distribuição não está equilibrada

#dados_balanceados <- downSample(fraudes_dummy, fraudes_dummy$fraude)

dados_balanceados <- recipe(fraude ~ ., data = fraudes_dummy) %>%
  themis::step_upsample(fraude) %>%
  prep() %>%
  juice()

# Gráfico dos dados balanceados 
dados_balanceados %>% ggplot(aes(x = fraude)) + geom_bar(stat = "count", 
                                                         fill = "darkgrey")

dados_balanceados %>% ggplot(aes(x = valor_compra)) + geom_bar(stat = "count", 
                                                               fill = "darkgrey")


# Criar um gráfico de dispersão com duas cores
#ggplot(fraudes, aes(x = pais, color = grupo)) +
# geom_bar() +
#scale_color_manual(values = c("grupo1" = "blue", "grupo2" = "red"))


# Ajustando o seed do script
set.seed(157)

########## separação do dataset em treino validação e teste ##########
particao <- createDataPartition(dados_balanceados$fraude, p = 0.8, times = 1,
                                list = F)

treino <- dados_balanceados[particao,]
teste <- dados_balanceados[-particao,]

table() # output legal para colocar no TCC
prop.table(table(treino$fraude))
prop.table(table(teste$fraude))


################ tunando a random forest / criar o grid de hiperparametros
hyperparameters <- expand.grid(mtry = c(3, 4, 5, 6, 7, 8))

# controle para validação cruzada
ctrl <- trainControl(method = 'cv', # cv indica K-fold cross validation
                     number = 5) # 5 numero de folds
print(ctrl)

#Definição da grade de valores para os hiperparâmetros
grid <- expand.grid(
  mtry = c(5,10,15),   # Número de variáveis explicativas selecionadas aleatoriamente para cada árvore
  ntree = c(50, 100, 2000), # Número de árvores na floresta
  nodesize = c(1, 5, 10))     # Tamanho mínimo do nó terminal


##### Random Forest ########

set.seed(157)

rf <- randomForest(x = treino[, -18],
                   y = treino$fraude,
                   xtest = teste[,-18],
                   yteste = teste$fraude,
                   ntree = 200,
                   mtry = 15,
                   replace = T,
                   nodesize = 10,
                   maznode = 15,
                   keep.forest = T)



#printar a random
rf 
plot(rf)
vip(rf)
varImpPlot(rf, sort = T) ### muito bom. Plota a importancia das variáveis 

# gerando a importancia das variáveis BOA ANÁLISE
print(rf$importance)
importance(rf, type = 1)
importance(rf, type = 2) # meandecreaseGIni - diminui as impurezas


######################## Predicts #####################
##adicionando predict no dataset de treino
treino$predicao <- predict(rf, treino, type = "class")

# adicionando predict na base de teste
teste$predicao <- predict(rf, teste, type = "class")

#verificando a probabilidade de ser ou não evento
predicao_2 = predict(rf, treino, type = "prob")
predicao_1 = predict(rf, teste, type = "prob")


#matriz de confusão
confusionMatrix(data = treino$predicao,
                reference = as.factor(treino$fraude),
                positive = "1")

confusionMatrix(data = teste$predicao,
                reference = as.factor(teste$fraude),
                positive = "1")


# verificando a matriz de confusao do output do modelo de florestas aleatórias com nossa variável dependente
mc1 <- confusionMatrix(data = teste$predicao,
                       reference = as.factor(teste$fraude), 
                       positive = "1")

# Verificando a capacidade de generalização ou presença de overfitting com o dataset de teste
mc2 <- confusionMatrix(data = teste$redicao,
                       reference = as.factor(teste$fraude), 
                       positive = "1")

# Plotar a matriz de confusão
ggplot(data = as.data.frame(mc1$table),
       aes(x = Reference, y = Prediction, fill = Freq)) +
  geom_tile() +
  geom_text(aes(label = sprintf("%d", Freq)), vjust = 1) +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(x = "Classe Verdadeira", y = "Classe Prevista", title = "Matriz de Confusão") +
  theme_minimal()


############## Curva Roc  ##################
ROC <- roc(response = treino$fraude, 
           predictor = predict() [,1])

# Calcula a curva ROC
roc_obj <- roc(fraude, )

ggplotly(
  ggroc(ROC, color = "blue", size = 1) +
    geom_segment(aes(x = 1, xend = 0, y = 0, yend = 1),
                 color="grey",
                 size = 0.2) +
    labs(x = "Especificidade",
         y = "Sensitividade",
         title = paste("Área abaixo da curva:",
                       round(ROC$auc, 3),
                       "|",
                       "Coeficiente de Gini",
                       round((ROC$auc[1] - 0.5) / 0.5, 3))) +
    theme_bw())

print(ROC)
plot(ROC)

ROC <- sensitivity(ROC, "fraude")

recall_values <- coords(ROC, "all", "rec")
specificity_values <- 1 - coords(ROC, "all", "spec")

plot(specificity_values, recall_values, type = "1", col = "blue",
     xlab = "1 - Especificidade", ylab = "Recall",
     main = "Curva Precision-Recall",
     xlim = c(0, 1), ylim = c(0, 1))

########### Recall ############
recall_classe1 <- mc1$byClass[ "fraude"]
cat("Recall para fraude:", recall_classe1, "\n")

recall_classe2 <- mc2$byClass["fraude"]
cat("Recall para fraude:", recall_classe1, "\n")

print(recall_classe1)

### FIM
