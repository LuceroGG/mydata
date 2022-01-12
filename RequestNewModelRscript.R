#request for new model

# load libraries
library(marginaleffects)
library(lmerTest)
library(splines)

# load data
data <- read.csv("https://raw.githubusercontent.com/LuceroGG/mydata/main/jacdata1.csv")

#model
model <- lmer(dependentvariable ~ Treatment*ns(Age_days, 2) + Sex + (1 | ID),
              data = data)

# Results from model
# > print(model)
# Linear mixed model fit by REML ['lmerModLmerTest']
# Formula: dependentvariable ~ Treatment * ns(Age_days, 2) + Sex + (1 | ID)
# Data: data
# REML criterion at convergence: -131.6208
# Random effects:
#   Groups   Name        Std.Dev.
# ID       (Intercept) 0.00000 
# Residual             0.09457 
# Number of obs: 85, groups:  ID, 30
# Fixed Effects:
#   (Intercept)                   TreatmentHighFat                   ns(Age_days, 2)1  
# 0.855434                           0.119768                           0.358344  
# ns(Age_days, 2)2                               SexM  TreatmentHighFat:ns(Age_days, 2)1  
# 0.194904                          -0.008387                          -0.309430  
# TreatmentHighFat:ns(Age_days, 2)2  
# -0.279797  
# optimizer (nloptwrap) convergence code: 0 (OK) ; 0 optimizer warnings; 1 lme4 warnings 

marginaleffects(model)
# Results from running marginaleffects on model
# > marginaleffects(model)
# Error in sanity_model_supported_class(model) : 
#   Models of class "lmerModLmerTest" are not supported.



#Request for a new model for the marginaleffects package

#Step 1: Check if marginaleffects default functions work:

# returns a named vector of coefficients
get_coef(model)

# Results
# 
# > get_coef(model)
# (Intercept)                  TreatmentHighFat                  ns(Age_days, 2)1 
# 0.855433591                       0.119768263                       0.358343999 
# ns(Age_days, 2)2                              SexM TreatmentHighFat:ns(Age_days, 2)1 
# 0.194903651                      -0.008387399                      -0.309430046 
# TreatmentHighFat:ns(Age_days, 2)2 
# -0.279796984 



# returns a named vector of predictions 
# returns a named matrix of size NxK for models with K levels (e.g., multinomial logit)
get_predict(model)

# Results
# get_predict(model)
# rowid predicted
# 1      1 0.8626260
# 2      2 1.0088498
# 3      3 1.1049420
# 4      4 0.8626260
# 5      5 1.0088498
# 6      6 1.1049420
# 7      7 0.8710134
# 8      8 1.0172372
# 9      9 1.1133294
# 10    10 0.8710134
# 11    11 1.0172372
# 12    12 1.1133294
# 13    13 0.8710134
# 14    14 1.0172372
# 15    15 1.1133294
# 16    16 0.8554336
# 17    17 1.0011080
# 18    18 1.1133294
# 19    19 0.8554336
# 20    20 1.0011080
# 21    21 1.1133294
# 22    22 0.8554336
# 23    23 1.0011080
# 24    24 1.1133294
# 25    25 0.8787841
# 26    26 0.9969002
# 27    27 1.1146395
# 28    28 0.8787841
# 29    29 0.9969002
# 30    30 1.1146395
# 31    31 0.8787841
# 32    32 0.9969002
# 33    33 1.1146395
# 34    34 0.8470462
# 35    35 1.0088498
# 36    36 1.1049420
# 37    37 0.8470462
# 38    38 1.0088498
# 39    39 1.1049420
# 40    40 0.8470462
# 41    41 1.0088498
# 42    42 1.1049420
# 43    43 0.8470462
# 44    44 1.0088498
# 45    45 1.1049420
# 46    46 0.9752019
# 47    47 1.0218887
# 48    48 0.9686292
# 49    49 0.9752019
# 50    50 1.0218887
# 51    51 0.9686292
# 52    52 0.9714760
# 53    53 1.0128033
# 54    54 0.9381055
# 55    55 0.9714760
# 56    56 1.0128033
# 57    57 0.9381055
# 58    58 0.9714760
# 59    59 1.0128033
# 60    60 0.9714760
# 61    61 1.0123229
# 62    62 0.9714760
# 63    63 1.0123229
# 64    64 0.9714760
# 65    65 1.0123229
# 66    66 0.9634701
# 67    67 0.9901371
# 68    68 1.0214130
# 69    69 0.9250343
# 70    70 0.9901371
# 71    71 1.0214130
# 72    72 0.9901371
# 73    73 1.0214130
# 74    74 0.9250343
# 75    75 0.9783776
# 76    76 1.0130256
# 77    77 0.9345697
# 78    78 0.9783776
# 79    79 1.0130256
# 80    80 0.9345697
# 81    81 0.9783776
# 82    82 0.9345697
# 83    83 0.9783776
# 84    84 1.0130256
# 85    85 0.9345697



# returns a named square matrix of size equal to the number of coefficients
get_vcov(model)

# Result
# > get_vcov(model)
# 7 x 7 Matrix of class "dpoMatrix"
# (Intercept) TreatmentHighFat ns(Age_days, 2)1 ns(Age_days, 2)2          SexM
# (Intercept)                        0.0007660967    -0.0006419319    -1.429028e-03    -1.921649e-04 -1.811479e-04
# TreatmentHighFat                  -0.0006419319     0.0015293885     1.423953e-03     1.998998e-04 -1.272717e-04
# ns(Age_days, 2)1                  -0.0014290282     0.0014239530     4.298987e-03     2.835508e-05  7.404373e-06
# ns(Age_days, 2)2                  -0.0001921649     0.0001998998     2.835508e-05     1.641143e-03 -1.128467e-05
# SexM                              -0.0001811479    -0.0001272717     7.404373e-06    -1.128467e-05  4.499629e-04
# TreatmentHighFat:ns(Age_days, 2)1  0.0014102372    -0.0031549443    -4.298219e-03    -2.952567e-05  3.927150e-05
# TreatmentHighFat:ns(Age_days, 2)2  0.0001884066    -0.0003610501    -2.820147e-05    -1.641377e-03  2.062011e-05
# TreatmentHighFat:ns(Age_days, 2)1 TreatmentHighFat:ns(Age_days, 2)2
# (Intercept)                                            1.410237e-03                      1.884066e-04
# TreatmentHighFat                                      -3.154944e-03                     -3.610501e-04
# ns(Age_days, 2)1                                      -4.298219e-03                     -2.820147e-05
# ns(Age_days, 2)2                                      -2.952567e-05                     -1.641377e-03
# SexM                                                   3.927150e-05                      2.062011e-05
# TreatmentHighFat:ns(Age_days, 2)1                      9.474513e-03                      1.708456e-04
# TreatmentHighFat:ns(Age_days, 2)2                      1.708456e-04                      3.687987e-03


# returns a new model object with different stored coefficients 
# calling get_predict(model) and get_predict(model_new) should produce different results
model_new <- set_coef(model, rep(0, length(get_coef(model))))
predict(model) != predict(model_new)

# Results :an object "model_new" in the enviroment and
# > model_new <- set_coef(model, rep(0, length(get_coef(model))))
# > predict(model) != predict(model_new) 
# 1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 
# 19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 
# 37    38    39    40    41    42    43    44    45    46    47    48    49    50    51    52    53    54 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 
# 55    56    57    58    59    60    61    62    63    64    65    66    67    68    69    70    71    72 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 
# 73    74    75    76    77    78    79    80    81    82    83    84    85 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 


class(model)

# > class(model)
# [1] "lmerModLmerTest"
# attr(,"package")
# [1] "lmerTest"
# Warning messages:
#   1: In class(object) <- "environment" :
#   Setting class(x) to "environment" sets attribute to NULL; result will no longer be an S4 object


