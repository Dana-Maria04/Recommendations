function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from mat that have strictly less then min_reviews reviews.
    
  % Numarul de review-uri pentru fiecare user
    reviewCounts = sum(mat ~= 0, 2);

  % Retinem doar liniile care au cel putin min_reviews review-uri
    rowsToKeep = reviewCounts >= min_reviews;

  % Returnam matricea redusa
    reduced_mat = mat(rowsToKeep, :);
endfunction