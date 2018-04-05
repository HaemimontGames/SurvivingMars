DefineClass.Playground = {
	__parents = {"Service"},
}

function Playground:Service(unit)
	unit.playground_visit = true
	Service.Service(self, unit)
end
