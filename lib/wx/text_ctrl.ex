defmodule WX.TextCtrl do
	def new(parent, attrs \\ []), do: :wxTextCtrl.new(parent, -1, attrs)
end