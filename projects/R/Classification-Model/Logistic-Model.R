library(tidyverse)
library(pROC)

set.seed(479)

data("mtcars")

mt <- mtcars %>%
  rownames_to_column(var = "model") %>%
  mutate(am = factor(am, levels = c(0, 1), labels = c("Automatic", "Manual"))) %>%
  select(model, am, hp, wt, mpg, qsec)

n <- nrow(mt)
train_idx <- sample(seq_len(n), size = floor(0.7 * n))

train <- mt[train_idx, ]
test  <- mt[-train_idx, ]

log_model <- glm(
  am ~ hp + wt + mpg + qsec,
  data = train,
  family = binomial(link = "logit")
)

test_probs <- predict(log_model, newdata = test, type = "response")

test_pred_class <- ifelse(test_probs >= 0.5, "Manual", "Automatic") %>%
  factor(levels = levels(train$am))

cm <- table(
  Actual = test$am,
  Predicted = test_pred_class
)

accuracy <- sum(diag(cm)) / sum(cm)

roc_obj <- roc(
  response = test$am,
  predictor = test_probs,
  levels = c("Automatic", "Manual"),
  direction = "<"
)

auc_value <- auc(roc_obj)

coef_df <- coef(summary(log_model)) %>%
  as.data.frame() %>%
  rownames_to_column(var = "term") %>%
  filter(term != "(Intercept)") %>%
  rename(
    estimate = Estimate,
    p_value = `Pr(>|z|)`
  ) %>%
  mutate(
    abs_estimate = abs(estimate)
  )

dir.create("Plots", showWarnings = FALSE)

roc_plot <- ggplot(
  data = data.frame(
    tpr = roc_obj$sensitivities,
    fpr = 1 - roc_obj$specificities
  ),
  aes(x = fpr, y = tpr)
) +
  geom_line() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  labs(
    title = paste0("ROC Curve (AUC = ", round(auc_value, 3), ")"),
    x = "False Positive Rate",
    y = "True Positive Rate"
  ) +
  theme_minimal()

ggsave("Plots/roc_curve.png", roc_plot, width = 6, height = 4, dpi = 300)

cm_df <- as.data.frame(cm)
colnames(cm_df) <- c("Actual", "Predicted", "Freq")

cm_plot <- ggplot(cm_df, aes(x = Predicted, y = Actual, fill = Freq)) +
  geom_tile(color = "white") +
  geom_text(aes(label = Freq), color = "black", size = 5) +
  scale_fill_gradient(low = "#FDE68A", high = "#F97316") +
  labs(
    title = paste0("Confusion Matrix (Accuracy = ", round(accuracy, 3), ")"),
    x = "Predicted Class",
    y = "Actual Class",
    fill = "Count"
  ) +
  theme_minimal()

ggsave("Plots/confusion_matrix.png", cm_plot, width = 5, height = 4, dpi = 300)

fi_plot <- ggplot(coef_df, aes(x = reorder(term, abs_estimate), y = abs_estimate)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Feature Importance (Absolute Coefficients)",
    x = "Predictor",
    y = "|Coefficient|"
  ) +
  theme_minimal()

ggsave("Plots/feature_importance.png", fi_plot, width = 5, height = 4, dpi = 300)
