## Sci-kit learn

import pandas as pd
print(pd.__version__)


data = pd.read_csv("https://bristol-training.github.io/applied-data-analysis-in-python/data/linear.csv")
data.head()

data.count()

import seaborn as sns

sns.relplot(data=data, x="x", y="y")

from sklearn.linear_model import LinearRegression

model = LinearRegression(fit_intercept=True)
model

X = data[["x"]]
y = data["y"]
model.fit(X, y)

pred = pd.DataFrame({"x": [0, 10]})  # Make a new DataFrame containing the X values
pred["y"] = model.predict(pred)  # Make a prediction and add that data into the table
pred


## Overfitting models

import pandas as pd

data = pd.read_csv("https://bristol-training.github.io/applied-data-analysis-in-python/data/linear.csv")
data
X = data[["x"]]
y = data["y"]

from sklearn.model_selection import train_test_split

train_X, test_X, train_y, test_y = train_test_split(X, y, random_state=42)
# random state function above helps generate the same exact random numbers above

# check train and test variables 75-25 split to train/test
train_y
test_y

import seaborn as sns

# Label the original DataFrame with the test/train split
# This is just used for plotting purposes
data.loc[train_X.index, "train/test"] = "train"
data.loc[test_X.index, "train/test"] = "test"

sns.relplot(data=data, x="x", y="y", hue="train/test")


from sklearn.linear_model import LinearRegression

model = LinearRegression(fit_intercept=True)
model.fit(train_X, train_y)

model.score(test_X, test_y)

## ML - Nearest neighbour 

import pandas as pd

data = pd.read_csv("https://bristol-training.github.io/applied-data-analysis-in-python/data/moons.csv")
data.head()

import seaborn as sns

sns.scatterplot(data=data, x="x1", y="x2", hue="y", palette="Dark2")


X = data[["x1", "x2"]]
y = data["y"]

# Split data into train and test

from sklearn.model_selection import train_test_split

train_X, test_X, train_y, test_y = train_test_split(X, y)

from sklearn.neighbors import KNeighborsClassifier

model = KNeighborsClassifier(n_neighbors=5)
model.fit(train_X, train_y)

model.score(test_X, test_y)

from sklearn.inspection import DecisionBoundaryDisplay

DecisionBoundaryDisplay.from_estimator(model, X, cmap="PRGn")
sns.scatterplot(data=X, x="x1", y="x2", hue=y, palette="Dark2")


##


import pandas as pd

data = pd.read_csv("https://bristol-training.github.io/applied-data-analysis-in-python/data/blobs.csv")
X = data[["x1", "x2"]]
y = data["y"]

import seaborn as sns

sns.scatterplot(data=data, x="x1", y="x2", hue="y", palette="Dark2")

from sklearn.model_selection import train_test_split

train_X, test_X, train_y, test_y = train_test_split(X, y)


# Correlation

from sklearn.datasets import fetch_california_housing

housing, target = fetch_california_housing(as_frame=True, return_X_y=True)

housing.head()
housing.corr()




print("f")