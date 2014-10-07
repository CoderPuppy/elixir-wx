defmodule WX.StaticText do
	def new(parent, text \\ "", attrs \\ [])
	def new(parent, text, attrs) when is_binary(text) or is_bitstring(text), do: new(parent, text |> String.to_char_list)
	def new(parent, text, attrs) when is_list(text), do: :wxStaticText.new(parent, -1, text, attrs)

	def set(ctrl, text) when is_binary(text) or is_bitstring(text), do: set(ctrl, text |> String.to_char_list)
	def set(ctrl, text) when is_list(text), do: :wxStaticText.setLabel(ctrl, text)
end