function img_edgemap = hysteratic(img_suppression, threshold_high, threshold_low)
    [X, Y] = size(img_suppression);
    imsize = X * Y;
    img_edgemap = img_suppression > threshold_high;
    queue_edge = find(img_edgemap == 1);
    rear = size(queue_edge, 1) + 1;

    img_candidate = (img_suppression > threshold_low) - img_edgemap;
    front = 1;
    while front ~= rear
        pos = queue_edge(front);
        for tmp = [pos-1 pos+1 pos-X pos+X]
            if tmp >= 1 && tmp <= imsize && img_edgemap(tmp) ~= 1 && img_candidate(tmp) == 1
                img_edgemap(tmp) = 1;
                queue_edge(rear) = tmp;
                rear = rear + 1;
            end
        end
        front = front + 1;
    end
    img_edgemap = 255 * img_edgemap;
end