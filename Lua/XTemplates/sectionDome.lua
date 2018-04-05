-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionDome",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "Dome",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "filter traits",
			'__template', "InfopanelButton",
			'RolloverText', T{363, --[[XTemplate sectionDome RolloverText]] "Filter Colonists in the Dome by desired or undesired traits. Colonists that do not match the filter will try to resettle in another Dome. If a Quarantine was set for the Dome, this action will remove it."},
			'RolloverTitle', T{362, --[[XTemplate sectionDome RolloverTitle]] "Filter by Traits"},
			'OnPressParam', "OpenFilterTraits",
			'Icon', "UI/Icons/IPButtons/colonists_accept.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelActiveSection",
			'OnContextUpdate', function (self, context, ...)
		local dome = ResolvePropObj(context)
	local accept = dome.allow_birth
	if accept then
		self:SetIcon("UI/Icons/Sections/birth_on.tga")
		self:SetTitle(T{8726, "<em>Births are allowed</em>"})
	else
		self:SetIcon("UI/Icons/Sections/birth_off.tga")
		self:SetTitle( T{8727, "<em>Births are forbidden</em>"})
	end
	rawset(self, "ProcessToggle", function(self, context, broadcast)
		local building = ResolvePropObj(context)
		building:ToggleAcceptBirth(broadcast)
		RebuildInfopanel(building)
	end)
	self.OnActivate = function (self, context, gamepad)
		self:ProcessToggle(context, not gamepad and IsMassUIModifierPressed())
	end
	self.OnAltActivate = function(self, context, gamepad)
		if gamepad then
			self:ProcessToggle(context, true)
		end
	end
	-- rollover
	self:SetRolloverTitle(T{8728, "Birth Control Policy"})
	if dome.allow_birth then
		self:SetRolloverText(T{8729, "Set the birth policy for this Dome. Colonists at high comfort will have children if births are allowed.<newline><newline>Current status: <em>Births are allowed</em>"})
		self:SetRolloverHint(T{8730, "<left_click> Forbid births in this Dome<newline><em>Ctrl + <left_click></em> Forbid births in all Domes"})
		self:SetRolloverHintGamepad(T{8731, "<ButtonA> Forbid births in this Dome<newline><ButtonX> Forbid births in all Domes"})
	else
		self:SetRolloverText(T{8732, "Set the birth policy for this Dome. Colonists at high comfort will have children if births are allowed.<newline><newline>Current status: <em>Births are forbidden</em>"})
		self:SetRolloverHint(T{8733, "<left_click> Allow births in this Dome<newline><em>Ctrl + <left_click></em> Allow births in all Domes"})
		self:SetRolloverHintGamepad(T{8734, "<ButtonA> Allow births in this Dome <newline><ButtonX> Allow births in all Domes"})
	end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelActiveSection",
			'OnContextUpdate', function (self, context, ...)
	local dome = ResolvePropObj(context)
	local accept = dome.accept_colonists
	if accept then
		self:SetIcon("UI/Icons/Sections/accept_colonists_on.tga")
		self:SetTitle(T{8735, "<em>Accepts Colonists</em>"})
	else
		self:SetIcon("UI/Icons/Sections/accept_colonists_off.tga")
		self:SetTitle( T{8736, "<em>Doesn't accept Colonists</em>"})
	end
	rawset(self, "ProcessToggle", function(self, context, broadcast)
		local building = ResolvePropObj(context)
		building:ToggleAcceptColonists(broadcast)
		RebuildInfopanel(building)
	end)
	self.OnActivate = function (self, context, gamepad)
		self:ProcessToggle(context, not gamepad and IsMassUIModifierPressed())
	end
	self.OnAltActivate = function(self, context, gamepad)
		if gamepad then
			self:ProcessToggle(context, true)
		end
	end
	-- rollover
	self:SetRolloverTitle(T{364, --[[XTemplate sectionDome RolloverTitle]] "Immigration Policy"})
	if dome.accept_colonists then
		self:SetRolloverText(T{7660, "Set the Immigration policy for this Dome.<newline><newline>Current status: <em>Accepts new Colonists</em>"})
		self:SetRolloverHint(T{7661, "<left_click> Stop accepting Colonists in this Dome<newline><em>Ctrl + <left_click></em> Stop accepting Colonists in all Domes"})
		self:SetRolloverHintGamepad(T{7662, "<ButtonA> Stop accepting Colonists in this Dome<newline><ButtonX> Stop accepting Colonists in all Domes"})
	else
		self:SetRolloverText(T{365, "Set the Immigration policy for this Dome.<newline><newline>Current status: <em>Doesn't accept Colonists</em>"})
		self:SetRolloverHint(T{7663, "<left_click> Accept Colonists in this Dome<newline><em>Ctrl + <left_click></em> Accept Colonists in all Domes"})
		self:SetRolloverHintGamepad(T{7664, "<ButtonA> Accept Colonists in this Dome<newline><ButtonX> Accept Colonists in all Domes"})
	end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{121681643085, --[[XTemplate sectionDome RolloverText]] "<UISectionCitizensRollover>"},
			'Title', T{371953345486, --[[XTemplate sectionDome Title]] "Colonists<right><ColonistCount> / <colonist(LivingSpace)>"},
			'Icon', "UI/Icons/Sections/colonist.tga",
			'TitleHAlign', "stretch",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{201464169022, --[[XTemplate sectionDome Text]] "<EmploymentMessage>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{613137333871, --[[XTemplate sectionDome Text]] "<ResidenceMessage>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{244389183434, --[[XTemplate sectionDome RolloverText]] "The average <em>Health</em> of all Colonists living in this Dome."},
			'RolloverTitle', T{455859065748, --[[XTemplate sectionDome RolloverTitle]] "Average Health <Stat(AverageHealth)>"},
			'Icon', "UI/Icons/Sections/health.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageHealth",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{607491882958, --[[XTemplate sectionDome RolloverText]] "The average <em>Sanity</em> of all Colonists living in this Dome."},
			'RolloverTitle', T{942703008133, --[[XTemplate sectionDome RolloverTitle]] "Average Sanity <Stat(AverageSanity)>"},
			'Icon', "UI/Icons/Sections/stress.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageSanity",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{327454642679, --[[XTemplate sectionDome RolloverText]] "<ComfortRollover>"},
			'RolloverTitle', T{577070564514, --[[XTemplate sectionDome RolloverTitle]] "Average Comfort <Stat(AverageComfort)>"},
			'Icon', "UI/Icons/Sections/comfort.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageComfort",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{856271865233, --[[XTemplate sectionDome RolloverText]] "The average <em>Morale</em> of all Colonists living in this Dome."},
			'RolloverTitle', T{765210150801, --[[XTemplate sectionDome RolloverTitle]] "Average Morale <Stat(AverageMorale)>"},
			'Icon', "UI/Icons/Sections/morale.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageMorale",
			}),
			}),
		}),
})

