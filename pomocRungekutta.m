function prvi = pomocRungekutta(x,f,y0,y2)
y = rungekutta(x,f,y0)
y(end) = y(end)-y2
prvi= y(end)

end