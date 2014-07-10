class Robot

	FACE = [ :north, :south, :east, :west ]

	def initialize(x: 0, y: 0, f: :north)
		@x = x
		@y = y
		@f = f
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

	def place(x, y, f)
		unless will_fall?(x, y)
			@x = x
			@y = y
			@f = f
		end
	end

	def move
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