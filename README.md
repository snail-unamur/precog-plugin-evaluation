# Pull Request Priorization and Visualization: Evaluation

The plugin aims to help developers select pull requests to evaluate depending on different factors. The objective of this first evaluation is to investigate the following dimensions for the plugin:

  1. Its ability to represent the difficulty of a Pull Request (PR).
  2. Its ability to sort PRs based on their estimated complexity.

## Evaluation setup 

The evaluation will be based on two complementary approaches:  

  - Qualitative methods: open-ended questions and Think Aloud sessions.
  - Quantitative methods: use of the UEQ (User Experience Questionnaire) evaluation + multiple-choice questionnaire (standard Likert scales).

### Population

We use a convenient sampling approach. Participants meet the following criteria:

  1. Having previous experience in code/PR review.
  2. Having a basic knowledge of Java.
  3. No prior knowledge of VSCode is required as the evaluation focuses on the plugin itself.

Ideally, the participant must have a diverse background and profile to enhance representativeness.

### Pull requests

The project used for the evaluation is *[to complete]*, written in Java. We chose this project because it is popular and large enough to have several pull requests of interest for our evaluation. The pull requests were selected according to the following procedure:

  1. We restricted pull requests to the following period to fit the current state of the practice: *[to complete]*
  2. We selected *[to complete]* pull requests with many lines modified (above *[to complete]*).
  3. We selected *[to complete]* pull requests with few lines modified (below *[to complete]*).
  4. We selected *[to complete]* pull requests with many lines added (above *[to complete]*).
  5. We selected *[to complete]* pull requests with few lines added (below *[to complete]*).
  6. We selected *[to complete]* pull requests with many lines removed (above *[to complete]*).
  7. We selected *[to complete]* pull requests with few lines removed (below *[to complete]*).
  8. We selected *[to complete]* pull requests that concern source files with a high complexity (*[measure to consider]* above *[to complete]*).
  9. We selected *[to complete]* pull requests that concern source files with a low complexity (*[measure to consider]* below *[to complete]*).

### Protocol

For each participant, we will execute the following steps.

#### Step 0: Presentation of the project

The participant is introduced to the project with a general overview of the different packages to gain an overall idea of the architecture and an overall introduction to the development practices related to pull requests, like naming conventions, etc.

#### Step 1: Ranking of the different PRs

We ask the participant to prioritize the different PRs without the help of the plugin. The goal is to compare the ranking offered by the formula that prioritizes the PRs in the plugin and a manual prioritization done by developers. 

For that, we give the participant 20 minutes maximum to familiarize themselves with the different pull requests before asking them to rank them in a think-aloud session. The rationale for having some time pressure is to force the participant to have a strategy to rapidly assess the pull requests. After the ranking, we ask the participant how confident they are in their answer using a standard Likert scale and if they have any other comments they want to share.






