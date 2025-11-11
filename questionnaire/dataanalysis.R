library(ggplot2)
library(ggalluvial)
library(tidyverse)
library(readxl)

# --------------------------------------------
# Input data
# --------------------------------------------

results <- read_excel("questionnaire-data.xlsx", sheet = "Sheet1") %>%
  select(
    -starts_with("Feedback -"),
    -starts_with("Points -")) %>%
  rename_with(~ gsub("\r\n", "", .)) # MS Forms adds \n to column names -_-

# --------------------------------------------
# Diagrams with final questions
# --------------------------------------------

results %>% 
  select(`How would you rate your overall experience with the plugin?`,
         `How easy was the plugin to understand?`,
         `To what extent do you think the plugin adds real value when selecting a PR?`,
         `How likely are you to use the plugin regularly in your work?`) %>%
  pivot_longer(cols = everything(), names_to = "Question", values_to = "Note") %>%
  ggplot(aes(
    y = factor(Question, levels = c('How likely are you to use the plugin regularly in your work?',
                                    'To what extent do you think the plugin adds real value when selecting a PR?',
                                    'How easy was the plugin to understand?',
                                    'How would you rate your overall experience with the plugin?')), 
    fill = factor(Note, levels = c('1', '2', '3', '4', '5')))) +
    geom_bar(position = position_stack(reverse = TRUE)) +
  theme(legend.position = "bottom") + 
  guides(fill = guide_legend(title = NULL)) +
  scale_fill_brewer(palette = "RdYlGn", name = "Note", drop = FALSE) +
  scale_x_continuous(limits = c(0, 9), breaks = 0:9) +
  theme(axis.text.y = element_text(size = 11)) +
  ylab(NULL) +
  xlab(NULL)

ggsave("plots/finalquestions.pdf", width = 20, height = 5.5, units = "cm")

# --------------------------------------------
# Sankey diagram with the rankings
# --------------------------------------------

# Classement de référence
classement_ref <- c(5,10,7,9,2,6,3,12,4)

# Classements des 6 participants
classements_participants <- list(
  P1 = c(3,2,4,5,10,9,12,7,6),
  P2 = c(9,3,4,10,5,2,12,6,7),
  P3 = c(2,10,5,4,3,9,7,12,6),
  P4 = c(12,9,2,5,10,3,7,6,4),
  P5 = c(4,9,3,12,2,5,6,7,10),
  P6 = c(3,4,10,5,9,7,12,2,6),
  P7 = c(3,9,2,12,10,5,4,6,7),
  P8 = c(3,4,5,9,2,6,10,12,7),
  P9 = c(4,5,10,9,12,3,2,6,7)
)

# Préparation des données
data <- data.frame()
for (p in names(classements_participants)) {
  classement <- classements_participants[[p]]
  temp <- data.frame(
    Participant = p,
    Élément = classement_ref,
    Rang_Ref = 1:length(classement_ref),
    Rang_Participant = sapply(classement_ref, function(e) which(classement == e))
  )
  data <- rbind(data, temp)
}

# Comptage des flux (tous participants confondus)
flux <- data %>%
  group_by(Rang_Ref, Rang_Participant) %>%
  summarise(count = n(), .groups = "drop") %>%
  mutate(
    Rang_Ref_lab = paste0("Ref_", Rang_Ref),
    Rang_Part_lab = paste0("Part_", Rang_Participant),
    alluvium = paste0(Rang_Ref, "_", Rang_Participant)  # identifiant unique du flux
  )


ggplot(flux,
       aes(axis1 = Rang_Ref_lab,
           axis2 = Rang_Part_lab,
           y = count)) +
  geom_alluvium(aes(fill = factor(Rang_Ref)), width = 1/8, alpha = 0.8) +
  geom_stratum(width = 1/8, fill = "white", color = "black") +
  geom_text(stat = "stratum", aes(label = gsub(".*_", "", after_stat(stratum))), size = 3) +
  scale_x_discrete(limits = c("PRECOG ranking", "Participants ranking"),
                   expand = c(.05, .05)) +
  scale_fill_brewer(palette = "RdYlBu") + # Should be colorblind safe (https://colorbrewer2.org/)
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    panel.grid = element_blank()
  ) + 
  ylab("Number of participants")

ggsave("plots/rankings.pdf", width = 18, height = 12, units = "cm")
