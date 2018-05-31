-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionStorage",
	PlaceObj('XTemplateGroup', {
		'__condition', function (parent, context) return (IsKindOf(context, "UniversalStorageDepot") or IsKindOf(context, "MechanizedDepot")) and not context:IsKindOf("SupplyRocket") and not IsKindOf(context, "SpaceElevator") end,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context and (context:DoesAcceptResource("Metals") or context:DoesAcceptResource("Concrete") or context:DoesAcceptResource("Food") or context:DoesAcceptResource("PreciousMetals")) end,
			'__template', "InfopanelActiveSection",
			'RolloverText', T{7983, --[[XTemplate sectionStorage RolloverText]] "You can disable the storage of certain resource types in this depot. No additional resources of these types will be transported to the depot."},
			'RolloverHint', T{7984, --[[XTemplate sectionStorage RolloverHint]] "<left_click> Customize storage permissions"},
			'RolloverHintGamepad', T{887447102904, --[[XTemplate sectionStorage RolloverHintGamepad]] "<ButtonA> Customize storage permissions"},
			'Title', T{494, --[[XTemplate sectionStorage Title]] "Basic Resources"},
			'Icon', "UI/Icons/Sections/basic_active.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
self.parent.idRollover2.Margins = box(0, 22, 0, -8)
self.parent.idContent.Margins = box(0, 0, 20, 0)
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnActivate(self, context)",
				'parent', function (parent, context) return parent.parent end,
				'func', function (self, context)
OpenBaseResourcesSelector(context, 1, self)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'Dock', "bottom",
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Metals") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Metals"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{496, --[[XTemplate sectionStorage Text]] "<resource('Metals' )><right><metals(Stored_Metals, MaxAmount_Metals)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Concrete") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Concrete"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{497, --[[XTemplate sectionStorage Text]] "<resource('Concrete' )><right><concrete(Stored_Concrete, MaxAmount_Concrete)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Food") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Food"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{498, --[[XTemplate sectionStorage Text]] "<resource('Food' )><right><food(Stored_Food, MaxAmount_Food)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("PreciousMetals") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("PreciousMetals"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{499, --[[XTemplate sectionStorage Text]] "<resource('PreciousMetals' )><right><preciousmetals(Stored_PreciousMetals, MaxAmount_PreciousMetals)>"},
				}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context and (context:DoesAcceptResource("Polymers") or context:DoesAcceptResource("Electronics") or context:DoesAcceptResource("MachineParts") or context:DoesAcceptResource("Fuel") or context:DoesAcceptResource("MysteryResource")) end,
			'__template', "InfopanelActiveSection",
			'RolloverText', T{7983, --[[XTemplate sectionStorage RolloverText]] "You can disable the storage of certain resource types in this depot. No additional resources of these types will be transported to the depot."},
			'RolloverHint', T{7984, --[[XTemplate sectionStorage RolloverHint]] "<left_click> Customize storage permissions"},
			'RolloverHintGamepad', T{383513035809, --[[XTemplate sectionStorage RolloverHintGamepad]] "<ButtonA> Customize storage permissions"},
			'Title', T{500, --[[XTemplate sectionStorage Title]] "Advanced Resources"},
			'Icon', "UI/Icons/Sections/advanced_active.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
self.parent.idRollover2.Margins = box(0, 22, 0, -8)
self.parent.idContent.Margins = box(2, 0, 20, 0)
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnActivate(self, context)",
				'parent', function (parent, context) return parent.parent end,
				'func', function (self, context)
OpenAdvancedResourcesSelector(context, 1, self)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'Dock', "bottom",
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Polymers") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Polymers"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{502, --[[XTemplate sectionStorage Text]] "<resource('Polymers' )><right><polymers(Stored_Polymers, MaxAmount_Polymers)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Electronics") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Electronics"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{503, --[[XTemplate sectionStorage Text]] "<resource('Electronics' )><right><electronics(Stored_Electronics, MaxAmount_Electronics)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("MachineParts") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("MachineParts"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{504, --[[XTemplate sectionStorage Text]] "<resource('MachineParts' )><right><machineparts(Stored_MachineParts, MaxAmount_MachineParts)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("Fuel") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("Fuel"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{505, --[[XTemplate sectionStorage Text]] "<resource('Fuel' )><right><fuel(Stored_Fuel, MaxAmount_Fuel)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:DoesAcceptResource("MysteryResource") end,
					'__template', "InfopanelText",
					'HandleKeyboard', false,
					'HandleMouse', false,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetTextColor(context:GetIPTextColor("MysteryResource"))
XText.OnContextUpdate(self, context, ...)				
end,
					'Text', T{8671, --[[XTemplate sectionStorage Text]] "<resource('MysteryResource' )><right><mysteryresource(Stored_MysteryResource, MaxAmount_MysteryResource)>"},
				}),
				}),
			}),
		}),
})

