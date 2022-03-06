FPcost.pca <- prcomp(FeaturesPremiumCRating[,c(1:15)],center=TRUE,scale.=TRUE)
FPfeat.pca <- prcomp(FeaturesPremiumCRating[,c(18:38)],center=TRUE,scale.=TRUE)

FP.gender <- c(rep("Female",2),"Male","Female",rep("Male",6),"Female","Male","Female",rep("Male",2),"Female","Male",rep("Female",2),rep("Male",2))
FP.type <- c("Rechargeable",rep("Manual",6),"Rechargeable Manual",rep("Manual",5),"Rechargeable",rep("Manual",5),"Rechargeable","Manual")

library(ggbiplot)

print(FPfeat.pca)


costcluster <- kmeans(FeaturesPremiumCRating[,c(1:15)],3,trace = TRUE)
plot(FeaturesPremiumCRating[,c(1:2)],col=costcluster)

ggbiplot(FPcost.pca,ellipse=TRUE,labels=rownames(FeaturesPremiumCRating),var.axes = FALSE,groups=FP.gender)+ggtitle("FP cost with gender")
ggbiplot(FPcost.pca,ellipse=TRUE,labels=rownames(FeaturesPremiumCRating),var.axes = FALSE,groups=FP.type)+ggtitle("FP cost with type")
ggbiplot(FPfeat.pca,ellipse=TRUE,labels=rownames(FeaturesPremiumCRating),var.axes = FALSE,groups=FP.gender)+ggtitle("FP feature with gender")
ggbiplot(FPfeat.pca,ellipse=TRUE,labels=rownames(FeaturesPremiumCRating),var.axes = FALSE, groups=FP.type)+ggtitle("FP feature with type")

#pairs(FeaturesPremiumCRating[,c(1:15)],labels=c("Timer","Pacer","Rechargeable","Distinguishable","Style","Stand","Head storage","Travel storage","Dual speed","Charity","Warranty","Built-in toothpaste","Battery indicator","Attachments","Extra head"),main="How much they are willing to pay for what function")

#pairs(FeaturesPremiumCRating[,c(18:38)],labels = c("Grip","Weight","On/Off","Clean/Rinse","Vibration","Waterproof","Travel","Replaceable Battery","Replaceable Brush Head","Replacement Cost","Availability","Long Batt Life","Technology","Looks cool","Distinguishable","Match decor","Easy to store","Small space","Easy to hold","Toothbrush sized","Packaging"),main="Characteristics Ratings")
summary(FPfeat.pca)



