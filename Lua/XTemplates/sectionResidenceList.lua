-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "Infopanel Sections",
	id = "sectionResidenceList",
	PlaceObj('XTemplateWindow', {
		'__class', "XContextControl",
		'HAlign', "center",
		'LayoutMethod', "HWrap",
		'OnContextUpdate', function (self, context, ...)
			local closed = context.capacity - context.closed
			local reserved = #context.reserved 
			for i, win in ipairs(self) do
				local person = context.colonists[i]
				win.idSpecialization:SetVisible(person)
				if person then
					win:SetIcon(person:GetInfopanelIcon())
					win.idSpecialization:SetImage(person.ip_specialization_icon)
				elseif reserved>0 then
					reserved = reserved-1
					win:SetIcon("UI/Infopanel/colonist_appointed.tga")
				elseif i <= closed then
					win:SetIcon("UI/Infopanel/colonist_empty.tga")
				else
					win:SetIcon("UI/Infopanel/colonist_closed.tga")
				end
				win:SetContext(person)
				XRecreateRolloverWindow(win)
			end
		end,
	}, {
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return context.colonists, 1, context.capacity end,
			'__context', function (parent, context, item, i, n) return item end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelPerson",
				'OnPress', function (self, gamepad)
					if self.context then
						self.context:Select(ResidenceCycle)
					end
				end,
				'OnAltPress', function (self, gamepad)
					local building = self.parent.context
					local icon =  self:GetIcon()
					local i = table.find(self.parent, self)
					if self.context then
						building:KickResident(self.context, i)
					elseif icon == "UI/Infopanel/colonist_empty.tga" or icon == "UI/Infopanel/colonist_appointed.tga" then
						building:ClosePositions(i)
					else
						building:OpenPositions(i)
					end
					ObjModified(building)
				end,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "GetRolloverTitle",
					'func', function (self, ...)
						local icon = self:GetIcon()						
						if self.context then
							return self.context:GetDisplayName()
						elseif icon == "UI/Infopanel/colonist_empty.tga" then
							return T(3976, "Free slot")
						elseif icon == "UI/Infopanel/colonist_appointed.tga" then
							return T(7981, "Reserved slot")
						else
							return T(4176, "Closed slot")
						end
					end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "GetRolloverText",
					'func', function (self, ...)
						local icon = self:GetIcon()
						if self.context then
							return T(4174, "A Colonist living in this building.<newline><newline>Specialization: <em><Specialization></em>")
						elseif icon == "UI/Infopanel/colonist_empty.tga" then
							return T(4175, "A free Residential slot.")
						elseif icon == "UI/Infopanel/colonist_appointed.tga" then
							return T(7982, "This slot is reserved for a colonist planning to move in from another Dome.")
						else
							return T(4177, "This slot is closed. Colonists will never occupy it.")
						end
					end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "GetRolloverHint",
					'func', function (self, ...)
						local icon = self:GetIcon()
						if self.context then
							return T(12193, "<left_click> Select  <right_click> Evict")
						elseif icon == "UI/Infopanel/colonist_empty.tga" then
							return T(8988, "<right_click> Close this residential slot")
						elseif icon == "UI/Infopanel/colonist_appointed.tga" then
							return T(8989, "Colonist on route")
						else
							return T(8990, "<right_click> Open this residential slot")
						end
					end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "GetRolloverHintGamepad",
					'func', function (self, ...)
						local icon = self:GetIcon()
						if self.context then
							return T(12194, "<ButtonA> Select  <ButtonX> Evict")
						elseif icon == "UI/Infopanel/colonist_empty.tga" then
							return T(8992, "<ButtonX> Close this residential slot")
						elseif icon == "UI/Infopanel/colonist_appointed.tga" then
							return T(8989, "Colonist on route")
						else
							return T(8993, "<ButtonX> Open this residential slot")
						end
					end,
				}),
				}),
			}),
		}),
})

