function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
    data_matrix = read_mat(path);
    processed_matrix = preprocess(data_matrix, min_reviews);

  % Aplicam SVD
    [U, S, V] = svds(processed_matrix, num_features);

  % Calculam similaritatile
    theme_similarities = zeros(1, size(V, 2));
    V = V';

  % Calculam similaritatile cu tema dorita 
    idx = 1;
    while idx <= size(V, 2)
        theme_similarities(idx) = cosine_similarity(V(:, liked_theme), V(:, idx));
        idx = idx + 1;
    endwhile

  % Sortam similaritatile
    [~, sorted_indices] = sort(theme_similarities, 'descend');
    sorted_indices(sorted_indices == liked_theme) = [];
  
  % Returnam primele num_recoms recomandari
    recoms = sorted_indices(1:num_recoms);
endfunction
