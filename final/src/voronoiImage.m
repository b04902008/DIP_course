function img = voronoiImage(nPart, Sx, Sy)
    img = zeros(Sx, Sy);
    Px = gallery('uniformdata', [1, nPart], 0) * Sx;
    Py = gallery('uniformdata', [1, nPart], 1) * Sy;
    [vx, vy] = voronoi(Px, Py);

    for i = 1:size(vx, 2)
        nPoints = max(abs(diff(vx(:,i))), abs(diff(vy(:,i)))) + 1;
        rIndex = round(linspace(vx(1,i), vx(2,i), nPoints));
        cIndex = round(linspace(vy(1,i), vy(2,i), nPoints));
        for j = 1:size(rIndex, 2)
            if rIndex(j) <= Sx && rIndex(j) >= 1 && cIndex(j) <= Sy && cIndex(j) >= 1
                img(rIndex(j), cIndex(j)) = 1;
            end
        end
    end
end