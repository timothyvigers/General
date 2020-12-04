# Format nlme results for RMarkdown
format_nlme_out <- function(model,eps = 0.0001,round = T,digits = 3,
                            varnames = NULL,rownames = T,kable = T,
                            caption = "Fixed Effects") {
  results <- as.data.frame(summary(model)$tTable)
  if (round == T) {
    results <- round(results,digits)
  }
  results$`p-value` <- format.pval(results$`p-value`,eps = eps)
  if (!is.null(varnames)) {
    for (n in 1:length(varnames)) {
      rownames(results) <- gsub(rownames(results)[n+1],varnames[n],rownames(results))
    }
  }
  if (rownames == F) {
    results$Variable <- c("(Intercept)",varnames)
    results <- results[,c("Variable","Value","Std.Error","DF","t-value","p-value")]
  }
  if (kable == T) {
    require(knitr)
    return(knitr::kable(results,caption = caption))
  } else if (kable == F) {
    return(results)
  }
}
format_nlme_out_type3 <- function(model,eps = 0.0001,round = T,digits = 3,
                                  varnames = NULL,rownames = T,kable = T,
                                  caption = "Overall Effects") {
  results <- as.data.frame(anova(model))
  if (round == T) {
    results <- round(results,digits)
  }
  results$`p-value` <- format.pval(results$`p-value`,eps = eps)
  if (!is.null(varnames)) {
    for (n in 1:length(varnames)) {
      rownames(results) <- gsub(rownames(results)[n+1],varnames[n],rownames(results))
    }
  }
  if (rownames == F) {
    results$Variable <- c("(Intercept)",varnames)
    results <- results[,c("Variable","numDF","denDF","F-value","p-value")]
  }
  if (kable == T) {
    require(knitr)
    return(knitr::kable(results,caption = caption))
  } else if (kable == F) {
    return(results)
  }
}
# Format Cox model results
format_cox_out <- function(model,eps = 0.0001,round = T,digits = 3,
                            varnames = NULL,kable = T,z = F) {
  results <- as.data.frame(summary(model)$coefficients)
  ci <- confint(model)
  results <- cbind(results,ci)
  if (round == T) {
    results <- round(results,digits)
  }
  results$`Pr(>|z|)` <- format.pval(results$`Pr(>|z|)`,eps = eps)
  if (!is.null(varnames)) {
    for (n in 1:length(varnames)) {
      rownames(results) <- gsub(rownames(results)[n],varnames[n],rownames(results))
    }
  }
  results$perc_change <- round((results$`exp(coef)` - 1)*100,digits)
  results$perc_change_2.5 <- round((exp(results$`2.5 %`) - 1)*100,digits)
  results$perc_change_97.5 <- round((exp(results$`97.5 %`) - 1)*100,digits)
  if (z == F) {
    results <- results[,c("coef","se(coef)","perc_change","perc_change_2.5","perc_change_97.5","Pr(>|z|)")]
    colnames(results) <- c("Estimate","SE","Percent Change","Percent Change 2.5% CI","Percent Change 97.5% CI","p-value")
  } else if (z == T) {
    results <- results[,c("coef","se(coef)","perc_change","perc_change_2.5","perc_change_97.5","z","Pr(>|z|)")]
    colnames(results) <- c("Estimate","SE","Percent Change","Percent Change 2.5% CI","Percent Change 97.5% CI","z","p-value")
  }
  
  if (kable == T) {
    require(knitr)
    return(knitr::kable(results))
  } else if (kable == F) {
    return(results)
  }
}
# Format logistic model results
format_logistic_out <- function(model,eps = 0.0001,round = T,digits = 3,
                           varnames = NULL,kable = T,caption = "Fixed Effects") {
  results <- as.data.frame(summary(model)$coefficients)
  results$odds <- exp(results$Estimate)
  results$perc_change <- (results$odds - 1)*100
  if (round == T) {
    results <- round(results,digits)
  }
  results$`Pr(>|z|)` <- format.pval(results$`Pr(>|z|)`,eps = eps)
  if (!is.null(varnames)) {
    for (n in 1:length(varnames)) {
      rownames(results) <- gsub(rownames(results)[n+1],varnames[n],rownames(results))
    }
  }
  results <- results[,c("Estimate","Std. Error","odds","perc_change","z value","Pr(>|z|)")]
  colnames(results) <- c("Estimate","Std. Error","Odds","Percent Change","z value","p-value")
  if (kable == T) {
    require(knitr)
    return(knitr::kable(results))
  } else if (kable == F) {
    return(results)
  }
}
# Plot a piecewise linear regression with one knot
plot_piecewise_single_knot <- function(data,model,xknot = 0,xvar,yvar,
                                       id = "record_id",group = NULL) {
  base_plot <- ggplot(data = data,aes_string(x = xvar,y = yvar,group = id)) + 
    theme_bw()
  if(!is.null(group)) {
    plot <- base_plot + 
      geom_line(aes_string(x = xvar,y = fitted(model),color = group))
  } else {
    plot <- base_plot + 
      geom_line(aes_string(x = xvar,y = fitted(model)))
  }
  plot + theme_bw()
}
