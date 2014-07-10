$: << '.'
require 'robot'

describe Robot do
	before(:each) { @robot = Robot.new }

	subject { @robot }

	describe 'can' do
		it 'be placed at X,Y,F' do
			expect(@robot).to respond_to(:place).with(3).arguments
		end

		it 'move' do
			expect(@robot).to respond_to(:move).with(0).arguments
		end

		it 'turn left' do
			expect(@robot).to respond_to(:left).with(0).arguments
		end

		it 'turn right' do
			expect(@robot).to respond_to(:right).with(0).arguments
		end

		it 'report current position' do
			expect(@robot).to respond_to(:report).with(0).arguments
		end

		it 'can understand and follow directives in sequence' do
			expect(@robot).to respond_to(:follow_directives).with(1).arguments
		end
	end

	describe '#place' do
		it 'put robot to specified position' do
			@robot.place(0, 0, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
			@robot.place(0, 4, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(4)
			expect(@robot.f).to eq(:north)
			@robot.place(4, 0, :north)
			expect(@robot.x).to eq(4)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
			@robot.place(4, 4, :north)
			expect(@robot.x).to eq(4)
			expect(@robot.y).to eq(4)
			expect(@robot.f).to eq(:north)
			@robot.place(2, 3, :north)
			expect(@robot.x).to eq(2)
			expect(@robot.y).to eq(3)
			expect(@robot.f).to eq(:north)
		end

		it 'cannot put robot out of the table' do
			@robot.place(-1, 0, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
			@robot.place(0, -1, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)			
			@robot.place(5, 0, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
			@robot.place(0, 5, :north)
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end
	end

	describe '#move' do
		it 'cannot move if not on the table' do
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end

		it 'move robot one unit step' do
			@robot.place(0, 0, :north)
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(1)
			expect(@robot.f).to eq(:north)
			@robot.f = :south
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:south)
			@robot.f = :east
			@robot.move
			expect(@robot.x).to eq(1)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:east)
			@robot.f = :west
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:west)
		end

		it 'cannot move robot out of table' do
			@robot.place(0, 0, :south)
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:south)
			@robot.place(0, 4, :north)
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(4)
			expect(@robot.f).to eq(:north)
			@robot.place(0, 0, :west)
			@robot.move
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:west)
			@robot.place(4, 0, :east)
			@robot.move
			expect(@robot.x).to eq(4)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:east)
		end
	end

	describe '#left' do
		it 'cannot turn left if not on the table' do
			@robot.left
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end

		it 'can turn left' do
			@robot.place(0, 0, :north)
			@robot.left
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:west)
			@robot.left
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:south)
			@robot.left
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:east)
			@robot.left
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end
	end

	describe '#right' do
		it 'cannot turn right if not on the table' do
			@robot.right
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end

		it 'can turn right' do
			@robot.place(0, 0, :north)
			@robot.right
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:east)
			@robot.right
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:south)
			@robot.right
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:west)
			@robot.right
			expect(@robot.x).to eq(0)
			expect(@robot.y).to eq(0)
			expect(@robot.f).to eq(:north)
		end
	end

	describe '#report' do
		it 'cannot report if not on the table' do
			expect(@robot.report).to eq("")
		end

		it 'can report' do
			@robot.place(0, 0, :north)
			expect(@robot.report).to eq('0,0,NORTH')
			@robot.place(0, 0, :west)
			expect(@robot.report).to eq('0,0,WEST')
			@robot.place(0, 0, :south)
			expect(@robot.report).to eq('0,0,SOUTH')
			@robot.place(0, 0, :east)
			expect(@robot.report).to eq('0,0,EAST')
		end
	end

	describe '#follow_directives' do
		it 'can follow directives' do
			directives_dir = File.expand_path('../directives/', __FILE__)
			Dir.foreach(directives_dir) do |directives_file|
				if (directives_file =~ /\.txt$/)
					@robot = Robot.new
					directives = File.readlines(File.join(directives_dir, directives_file))
					expected_output, actual_output = @robot.follow_directives(directives)
					expect(expected_output).to eq(actual_output)
				end
			end
		end
	end
end