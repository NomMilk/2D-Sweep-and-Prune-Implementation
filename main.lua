local Circle = require "circle"
local sorted_circles = {}

function SortByLeft(a, b)
	return a.x < b.x
end

function love.load()
	circle_1 = Circle.new(203, 200, 30)
	circle_2 = Circle.new(201, 80, 30)
	circle_3 = Circle.new(70, 200, 30)
	circle_4 = Circle.new(400, 200, 30)
	circle_5 = Circle.new(205, 300, 30)
	circle_6 = Circle.new(205, 350, 30)
	circle_7 = Circle.new(285, 400, 30)
	circle_8 = Circle.new(535, 400, 30)

	table.insert(sorted_circles, circle_1)
	table.insert(sorted_circles, circle_2)
	table.insert(sorted_circles, circle_3)
	table.insert(sorted_circles, circle_4)
	table.insert(sorted_circles, circle_5)
	table.insert(sorted_circles, circle_6)
	table.insert(sorted_circles, circle_7)
	table.insert(sorted_circles, circle_8)
end

function love.update(dt)
	table.sort(sorted_circles, SortByLeft)
	print(sorted_circles[1].x, sorted_circles[2].x, sorted_circles[3].x, sorted_circles[4].x, sorted_circles[5].x, sorted_circles[6].x, sorted_circles[7].x, sorted_circles[8].x)

	for I = 1, #sorted_circles do
		first_circle = sorted_circles[I]
		for II = I + 1, #sorted_circles do
			second_circle = sorted_circles[II]
			
			if second_circle.x - second_circle.radius >
			   first_circle.x + first_circle.radius then
				break
			end
			
			if second_circle.y - second_circle.radius <=
			   first_circle.y + first_circle.radius
			   and second_circle.y + second_circle.radius >=
			   first_circle.y - first_circle.radius then
				love.timer.sleep(0.2)
				first_circle:Intersect(second_circle)
			end
		end
	end
end

function love.draw()
	circle_1:draw()
	circle_2:draw()
	circle_3:draw()
	circle_4:draw()
	circle_5:draw()
	circle_6:draw()
	circle_7:draw()
	circle_8:draw()
end
