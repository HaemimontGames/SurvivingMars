-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customSpaceElevator",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "SpaceElevator",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "alllow/forbid export",
			'__template', "InfopanelButton",
			'OnContextUpdate', function (self, context, ...)
if context.allow_export then
	self:SetIcon("UI/Icons/IPButtons/forbid_exports_on.tga")
	self:SetRolloverTitle(T{7818, "Forbid Exports"})
	self:SetRolloverText(T{7819, "Forbid the export of Rare Metals."})
else
	self:SetIcon("UI/Icons/IPButtons/forbid_exports_off.tga")
	self:SetRolloverTitle(T{7820, "Allow Exports"})
	self:SetRolloverText(T{7821, "Allow the export of Rare Metals."})
end
end,
			'OnPressParam', "ToggleAllowExport",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{7694, --[[XTemplate customSpaceElevator RolloverText]] "Current status of the Space Elevator."},
			'Title', T{49, --[[XTemplate customSpaceElevator Title]] "Status"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{418, --[[XTemplate customSpaceElevator Text]] "<Status>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context.current_imports end,
			'__template', "InfopanelSection",
			'RolloverText', T{7410, --[[XTemplate customSpaceElevator RolloverText]] "Payload of this Rocket"},
			'Title', T{415, --[[XTemplate customSpaceElevator Title]] "Payload"},
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{417, --[[XTemplate customSpaceElevator Text]] "<CargoManifest>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{420, --[[XTemplate customSpaceElevator RolloverText]] "Exports on the Space Elevator"},
			'Title', T{419, --[[XTemplate customSpaceElevator Title]] "Export"},
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{421, --[[XTemplate customSpaceElevator Text]] "<ExportManifest>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{423, --[[XTemplate customSpaceElevator RolloverText]] "Resources delivered by the Space Elevator"},
			'Title', T{422, --[[XTemplate customSpaceElevator Title]] "Delivered Resources"},
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{424, --[[XTemplate customSpaceElevator Text]] "<StorageManifest>"},
			}),
			}),
		}),
})

