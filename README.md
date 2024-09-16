# Recommendations

Preprocessing
The function preprocess takes a matrix A and an integer min_count as parameters. It removes from the matrix all clients (rows) who have given fewer than min_count reviews.

The steps for the preprocess function are as follows:

### Calculate the number of reviews for each client:
Each row in the matrix represents a client. We need to calculate how many evaluations (non-zero entries) each client has made. We use the sum function on each row to calculate the number of evaluations: reviewCounts = sum(mat ~= 0, 2);
- mat ~= 0 generates a binary matrix of the same size as mat, with 1 for non-zero elements and 0 for zero elements.
- sum(..., 2) computes the sum for each row, resulting in a vector containing the number of evaluations for each client.

##### Identify rows to keep:
- Determine which clients have given a number of reviews greater than or equal to min_count.

- Create a logical vector (true or false) that marks the rows to keep.

- rowsToKeep will contain true for clients who have given enough reviews and false for those who have not.

#### Reduce the matrix:
- Use the rowsToKeep vector to select only the rows corresponding to active clients. reduced_mat will contain only the rows (clients) who have given a sufficient number of reviews.

- The complexity of the preprocess function is O(n*m), where n is the number of clients (rows) and m is the number of items (columns).

## Cosine Similarity
The function cosine_similarity takes two vectors as parameters and calculates the cosine similarity between them.

The formula for cosine similarity is: cosine_similarity = dot(a, b) / (norm(a) * norm(b));

- dot(a, b) is the dot product between vectors a and b.
- norm(a) computes the norm of vector a.

The cosine_similarity function returns a real number between -1 and 1 that represents the cosine similarity between the two vectors.

The steps are as follows:

#### Calculate the dot product:
The dot product between two vectors a and b is calculated element-wise and then summed: dot_product = sum(a .* b);

#### Calculate the norms of the vectors:
The norms of vectors a and b are calculated as the square root of the sum of the squares of their elements:
- norm_a = sqrt(sum(a .^ 2));
- norm_b = sqrt(sum(b .^ 2));

#### Calculate the cosine similarity:
Cosine similarity is the dot product between a and b, divided by the product of their norms.

Functions used include sum for summing elements, sqrt for computing square roots, .* for element-wise multiplication, as well as dot for computing the dot product between two vectors and norm for calculating the Euclidean norm of a vector.

The complexity of the cosine_similarity function is O(n), where n is the size of the vectors.


## Singular Value Decomposition
The function recommendations takes the path to a .csv file, the index of the liked item, the number of recommended items, the minimum number of reviews, and the number of singular values to keep. It returns the indices of the recommended items.

The steps are as follows:

#### Load the matrix from the .csv file:
The first step involves reading data from the .csv file and loading it into a matrix. This is done by reading the CSV file and returning its contents as a matrix.

mat = csvread(path);

#### Preprocess the matrix:

The next step is to preprocess the matrix to remove clients who have given fewer than a certain minimum number of reviews. This involves calculating the number of reviews (non-zero values) for each row and keeping only the rows that meet the minimum review criterion.

#### Calculate the reduced SVD:
After preprocessing, compute the reduced Singular Value Decomposition (SVD) of the matrix. This involves decomposing the preprocessed matrix into three matrices, keeping only the top singular values. This reduces the problem size and focuses on the most important features of the data.

#### Calculate item similarity:
To recommend items similar to the liked item, calculate the cosine similarity between the vector corresponding to the liked item and each of the other item vectors. Cosine similarity measures how similar two items are based on the angle between their feature vectors.

#### Return indices of recommended items:

After calculating similarities, the items are sorted in descending order of similarity. The liked item is excluded (since it does not make sense to recommend it again), and the top num_recoms items from the sorted list are selected. The indices of these items are returned as recommendations.

Functions used include csvread for reading data from a .csv file, preprocess to remove clients with too few reviews, svds for calculating the reduced SVD of the matrix, cosine_similarity for computing the cosine similarity between two vectors, and sort for sorting vectors in descending order.

In terms of complexity, recommendations is influenced by various complexities such as file reading and preprocessing, which are O(n*m), as well as similarity calculation with complexity O(m^2), where n is the number of clients and d is the number of items (columns).
