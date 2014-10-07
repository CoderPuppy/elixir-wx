defmodule WXTest do
	def create_scene do
		server = WX.Server.new
		frame = WX.Frame.new(server, "HI!", size: {250, 150})
		panel = WX.Panel.new(frame)
		res = WX.StaticText.new(panel, "Hello World!")
		name_input = WX.TextCtrl.new(panel)
		sizer = WX.BoxSizer.new(WX.vertical)
		WX.Sizer.add(sizer, [res, name_input])
		WX.Panel.set_sizer panel, sizer

		WX.Events.connect(name_input, :command_text_updated)
		WX.Events.connect(frame, :close_window)

		WX.Frame.show frame

		%{
			server: server,
			frame: frame,
			panel: panel,
			res: res,
			name_input: name_input,
			sizer: sizer
		}
	end

	def loop(scene) do
		receive do
			msg ->
				IO.inspect {msg, scene}
				frame = scene.frame
				name_input = scene.name_input
				res = scene.res
				case msg do
					{:wx, _, ^frame, _, {:wxClose, :close_window}} -> :ok
					{:wx, _, ^name_input, _, {:wxCommand, :command_text_updated, name, _, _}} ->
						WX.StaticText.set res, "Hello #{name}!"
						loop(scene)
					_ -> loop(scene)
				end
		end
	end
end
WXTest.loop(WXTest.create_scene)