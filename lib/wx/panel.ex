defmodule WX.Panel do
	def new(parent, attrs \\ []), do: :wxPanel.new(parent, attrs)

	def set_sizer(panel, sizer), do: :wxPanel.setSizer(panel, sizer)
end