function F = pencilDraw(I, sigma_s, sigma_r, multiple, num_iter)
    [~, Kp] = NC(I, I, sigma_s, sigma_r, num_iter);
    F = Kp * multiple;
end