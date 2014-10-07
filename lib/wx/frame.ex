defmodule WX.Frame do
	def new(parent, title, attrs \\ [])
	def new(parent, title, attrs) when is_binary(title) or is_bitstring(title), do: new(parent, title |> String.to_char_list, attrs)
	def new(parent, title, attrs) when is_list(title), do: :wxFrame.new(parent, -1, title, attrs)

	def show(frame), do: :wxFrame.show(frame)
end