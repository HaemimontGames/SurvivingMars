----- XHideMapOverviewCurtainsLayer

DefineClass.XHideMapOverviewCurtainsLayer = {
	__parents = { "XLayer" },
	Dock = "ignore",
	HandleMouse = false,
}

function XHideMapOverviewCurtainsLayer:Init()
	HideOverviewMapCurtains(true)
end

function XHideMapOverviewCurtainsLayer:Done()
	HideOverviewMapCurtains(false)
end