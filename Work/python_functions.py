#-------------------------------------------------------------------------------
#
# This file contains several useful Python functions for statistical analysis.
#
# v 2.0
# Tim Vigers
# Last updated July 16, 2020
#
#-------------------------------------------------------------------------------

# 2 component PCA on a pandas dataframe.
def two_comp_pca(features,outcome,data):
    x = data[features]
    # Drop missing values
    x = x.dropna()
    # Scale columns
    x = StandardScaler().fit_transform(x)
    # PCA
    pca = PCA(n_components=2)
    pc = pca.fit_transform(x)
    pcDf = pd.DataFrame(data = pc,
                        columns = ['principal component 1','principal component 2'])
    finalpcDf = pd.concat([pcDf, data[outcome]], axis = 1, join="inner")
