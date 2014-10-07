defmodule WX.Events do
	def connect(evt_handler, type), do: :wxEvtHandler.connect(evt_handler, type)
end