
x1 = [1 1 1 1]
y1 = [1 1 -1 -1]
x2 = [1 -1 1 -1]
y2 = [1 -1 -1 1]

% x3 = [];
% y3 = [];

yt = [1 -1 1 1]


% Perform element-wise multiplication
x1_t_y1 = x1' * y1
x2_t_y2 = x2' * y2
% x3_t_y3 = x3' * y3
w = (x1' * y1) + (x2' * y2) % + (x3' * y3)

% Perform forward recall for original pattern pairs
x1_w = x1 * w
if Gh(x1 * w) == y1
    y1 = Gh(x1 * w)
end
x2_w = x2 * w
if Gh(x2 * w) == y2
    y2 = Gh(x2 * w)
end
%{
x3_w = x3 * w
if Gh(x3 * w) == y3
    y3 = Gh(x3 * w)
end
%}

% Perform Backward recall for original pattern pairs
y1_wt = y1 * w'
if Gh(y1 * w') == x1
    x1 = Gh(y1 * w')
end
y2_wt = y2 * w'
if Gh(y2 * w') == x2
    x2 = Gh(y2 * w')
end
%{
y3_wt = y3 * w'
if Gh(y3 * w') == x3
    x3 = Gh(y3 * w')
end
%}

% Perform forward recall for complimentory pattern pairs
x1c_w = -x1 * w
if Gh(-x1 * w) == -y1
    y1_c = Gh(-x1 * w)
end
x2c_w = -x2 * w
if Gh(-x2 * w) == -y2
    y2_c = Gh(-x2 * w)
end
%{
x3c_w = -x3 * w
if Gh(-x3 * w) == -y3
    y3_c = Gh(-x3 * w)
end
%}

% Perform Backward recall for complimentory pattern pairs
y1c_wt = -y1 * w'
if Gh(-y1 * w') == -x1
    x1_c = Gh(-y1 * w')
end
y2c_wt = -y2 * w'
if Gh(-y2 * w') == -x2
    x2_c = Gh(-y2 * w')
end
%{
y3c_wt = -y3 * w'
if Gh(-y3 * w') == -x3
    x3_c = Gh(-y3 * w')
end
%}

% noisy vector forward recall
xt_w = xt * w
yt = Gh(xt * w)

% noisy vector backward recall
yt_wt = yt * w'
Gh(yt * w')
