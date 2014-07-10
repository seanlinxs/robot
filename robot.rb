class Robot

	FACE = [ :north, :south, :east, :west ]

	def initialize(x: 0, y: 0, f: :north)
		@x = x
		@y = y
		@f = f
		@placed = false
	end

	def x
		@x
	end

	def x=(x)
		@x = x
	end

	def y
		@y
	end

	def y=(y)
		@y = y
	end

	def f
		@f
	end

	def f=(f)
		@f = f
	end

	def placed?
		@placed
	end

	def place(x, y, f)
		unless will_fall?(x, y)
			@x = x
			@y = y
			@f = f
			@placed = true
		end
	end

	def move
		if placed?
			case f
			when :north then self.y += 1 unless will_fall?(x, y + 1)
			when :south then self.y -= 1 unless will_fall?(x, y - 1)
			when :east  then self.x += 1 unless will_fall?(x + 1, y)
			when :west  then self.x -= 1 unless will_fall?(x - 1, y)
			end
		end
	end

	def left
	end

	def right
	end

	def report
	end

    private
	
	def will_fall?(x, y)
		x < 0 || x > 4 || y < 0 || y > 4
	end
end