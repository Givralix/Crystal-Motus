require "crsfml"

# create the window
window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Motus")

# run the program as long as the window is open
while window.open?
	# check all the window's events that were triggered since the last iteration of the loop
	while event = window.poll_event
		# "close requested" event: we close the window
		if event.is_a? SF::Event::Closed
			window.close
		end
	end

	# clear the window with black color

	# draw everything here...
	rectangle = SF::RectangleShape.new(SF.vector2(700,500))

	rectangle.fill_color = SF.color(190, 60, 130)

	rectangle.position = SF.vector2(50, 50)

	window.clear(SF.color(190, 60, 100))
	window.draw(rectangle)
	# end the current frame
	window.display
end
