function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  dot_product = dot(A, B);

  % Aflu normele vectorilor
    norm_A = norm(A);
    norm_B = norm(B);

  % Calculez similaritatea cosinus
    similarity = dot_product / (norm_A * norm_B);
endfunction