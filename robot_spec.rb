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
	end

	describe '#place' do
		it 'put robot to specified position' do
			@robot.place(1, 1, :north)
			expect(@robot.x).to eq(1)
			expect(@robot.y).to eq(1)
			expect(@robot.f).to eq(:north)
		end
	end
end