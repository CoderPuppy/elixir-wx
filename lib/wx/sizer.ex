defmodule WX.Sizer do
	def add(sizer, all) when is_list(all), do: add_impl(sizer, all |> List.flatten)
	def add(sizer, all), do: add(sizer, [all])

	defp add_impl(sizer, [{ctrl, opts} | tail]) do
		:wxSizer.add(sizer, ctrl, opts)
		add_impl(sizer, tail)
	end
	defp add_impl(sizer, [ctrl | tail]), do: add_impl(sizer, [ {ctrl, []} | tail ])
	defp add_impl(sizer, []), do: nil
end