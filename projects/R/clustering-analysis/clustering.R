library(tidyverse)
library(cluster)
library(ggplot2)
library(reshape2)

# 1. Load & Prepare Data ---------------------------------------------------

df <- mtcars
df_scaled <- scale(df)
dist_matrix <- dist(df_scaled)

# 2. K-Means ---------------------------------------------------------------

set.seed(123)
k <- 4
km <- kmeans(df_scaled, centers = k, nstart = 25)

print(table(km$cluster))
print(km$centers)

# 3. Hierarchical Clustering ----------------------------------------------

hc <- hclust(dist_matrix, method = "complete")

plot(hc, main = "Hierarchical Clustering Dendrogram")
rect.hclust(hc, k = k, border = "red")

# 4. PCA Visualization -----------------------------------------------------

pca <- prcomp(df_scaled)
pca_df <- data.frame(
  PC1 = pca$x[, 1],
  PC2 = pca$x[, 2],
  cluster = factor(km$cluster)
)

pca_plot <- ggplot(pca_df, aes(PC1, PC2, color = cluster)) +
  geom_point(size = 3, alpha = 0.8) +
  theme_minimal() +
  labs(
    title = "PCA Visualization of K-Means Clusters",
    color = "Cluster"
  )

print(pca_plot)

# 5. Silhouette Analysis ---------------------------------------------------

sil <- silhouette(km$cluster, dist(df_scaled))
plot(sil, border = NA, main = "Silhouette Plot for K-Means")
print(mean(sil[, 3]))

# 6. Cluster Profiles ------------------------------------------------------

cluster_summary <- df_scaled %>%
  as.data.frame() %>%
  mutate(cluster = km$cluster) %>%
  group_by(cluster) %>%
  summarize(across(everything(), mean))

print(cluster_summary)

profile_df <- cluster_summary %>%
  pivot_longer(-cluster, names_to = "variable", values_to = "mean_value")

profile_plot <- ggplot(profile_df, aes(variable, mean_value, fill = factor(cluster))) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(
    title = "Cluster Profiles Across Variables",
    x = "Variable",
    y = "Mean Value",
    fill = "Cluster"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(profile_plot)

# 7. Linkage Comparison ----------------------------------------------------

hc_complete <- hclust(dist_matrix, method = "complete")
hc_average  <- hclust(dist_matrix, method = "average")
hc_single   <- hclust(dist_matrix, method = "single")

par(mfrow = c(1, 3))
plot(hc_complete, main = "Complete Linkage")
plot(hc_average, main = "Average Linkage")
plot(hc_single, main = "Single Linkage")
par(mfrow = c(1, 1))

# 8. Export Plots ----------------------------------------------------------

png("cluster_pca_plot.png", width = 1200, height = 900)
print(pca_plot)
dev.off()

png("dendrogram.png", width = 1200, height = 900)
plot(hc)
rect.hclust(hc, k = k, border = "red")
dev.off()

png("cluster_profile_plot.png", width = 1400, height = 900)
print(profile_plot)
dev.off()
