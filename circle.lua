Circle = {}
Circle.__index = Circle

function Circle.new(x, y, radius)
	local instance = setmetatable({}, Circle)

	instance.x = x
	instance.y = y
	instance.radius = radius
	instance.speed = 3
	
	instance.x_direction = instance.speed
	instance.y_direction = instance.speed
	instance.color = {1, 1, 1}
	
	return instance
end

function Circle:draw()
	self.x += self.x_direction
	self.y += self.y_direction
	
	if self.x <= self.radius/2 then
		self.x_direction = self.x_direction * -1
	end

	if self.x >= love.graphics.getWidth() then
		self.x_direction = self.x_direction * -1
	end

	if self.y <= self.radius/2 then
		self.y_direction = self.y_direction * -1
	end

	if self.y >= love.graphics.getHeight() then
		self.y_direction = self.y_direction * -1
	end

	love.graphics.setColor(self.color)
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Circle:Intersect(circle)
	print(self.x, circle.x)

	local dx = self.x - circle.x
	local dy = self.y - circle.y

	local distance_squared = dx * dx + dy * dy
	distance = math.sqrt(distance_squared)

	local radius_sum = self.radius + circle.radius

	if distance > radius_sum then
		return false
	end

	local x_normal = dx/distance
	local y_normal = dy/distance

	self.x_direction = x_normal * self.speed
	self.y_direction = y_normal * self.speed

	circle.x_direction = -1 * x_normal * self.speed
	circle.y_direction = -1 * y_normal * self.speed

	return true
end

return Circle
