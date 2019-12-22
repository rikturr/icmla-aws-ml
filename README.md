# Running and analyzing machine learning experiments in the cloud with AWS, Python, and R

This is the code accompanying the tutorial given at [IEEE ICMLA 2019](https://www.icmla-conference.org/icmla19/) titled "Running and analyzing machine learning experiments in the cloud with AWS, Python, and R".

This tutorial provides an introduction to the cloud via Amazon Web Services (AWS) and covers launching Jupyter notebooks backed by machines in the cloud, some ML with scikit-learn, and analyzing the results using R and Shiny.

![thereisnocloud](https://miro.medium.com/max/650/1*el4nHcOQdfHxzzcTC99jDw.png)

# Content

The slides are available here: [slides.pdf](https://github.com/rikturr/icmla-aws-ml/blob/master/slides.pdf)

The videos for each part are on YouTube:

- Part 1: [Intro to the cloud](https://youtu.be/V_-Hu0PtJu8)
- Part 2 [ML with Python in Jupyter](https://youtu.be/wQUv5wglo84)
- Part 3 [Shiny dashboard with R](https://youtu.be/O52FqcREyIo)

## Part 1: Introduction to the cloud and Amazon Web Services

- What is the cloud?
- Why use the cloud for ML experimentation?
- Review AWS services: S3, EC2, SageMaker
- Walkthrough of setting up AWS account via the [AWS web console](http://console.aws.amazon.com)
- Launch our first Jupyter notebook in the cloud!

## Part 2: ML with Python in Jupyter

- Using Medicare payments data, can we predict provider specialties from their billed procedures?
- Data processing, exploratory analysis, sparse matrix creation [1-medicare-data.ipynb](https://github.com/rikturr/icmla-aws-ml/blob/master/1-medicare-data.ipynb)
- Train Random Forest model [2-scikit-learn.ipynb](https://github.com/rikturr/icmla-aws-ml/blob/master/2-scikit-learn.ipynb)
- Set up grid search experiment that saves results to S3

## Part 3: Shiny dashboard with R

- Explore grid search results [3-results-analysis.Rmd](https://github.com/rikturr/icmla-aws-ml/blob/master/3-results-analysis.Rmd)
- Create Shiny dashboard with R [4-shiny-dashboard](https://github.com/rikturr/icmla-aws-ml/blob/master/4-shiny-dashboard/app.R)
- Deploy dashboard to [shinyapps.io](https://www.shinyapps.io)

An live example of the Shiny dashboard is here: https://rikturr.shinyapps.io/results_dashboard/

## Part 4: Heavy experimentation

Part 4 was mostly skipped due to lack of time during the tutorial, but the code and previous video walkthrough can be found in this repo: [aws-ml-experimenter](https://github.com/rikturr/aws-ml-experimenter)