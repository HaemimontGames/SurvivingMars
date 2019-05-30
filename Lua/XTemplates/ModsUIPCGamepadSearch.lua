-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIPCGamepadSearch",
	PlaceObj('XTemplateTemplate', {
		'__template', "ModsUIPopupBase",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XEdit",
			'Id', "idEdit",
			'Margins', box(20, 20, 20, 40),
			'Padding', box(20, 15, 20, 15),
			'MinWidth', 400,
			'MaxWidth', 400,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'RelativeFocusOrder', "new-line",
			'TextStyle', "LogInEdit",
			'ConsoleKeyboardTitle', T(10485, --[[XTemplate ModsUIPCGamepadSearch ConsoleKeyboardTitle]] "Search mods..."),
			'MaxLen', 128,
			'AutoSelectAll', true,
			'NegFilter', "<>",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnShortcut(self, shortcut, source)",
				'func', function (self, shortcut, source)
					if shortcut == "ButtonA" then
						self:OpenControllerTextInput()
						return "break"
					end
					return XEdit.OnShortcut(self, shortcut, source)
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnTextChanged",
				'func', function (self, ...)
					XEdit.OnTextChanged(self, ...)
					local text = self:GetText()
					if text == _InternalTranslate(T(10485, "Search mods...")) then
						text = ""
					end
					local dlg = GetDialog(self)
					local context = ResolvePropObj(dlg.context)
					context.temp_query = text
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					XEdit.Open(self, ...)
					CreateRealTimeThread(function()
						self:OnMouseButtonDown(nil, "L")
					end)
				end,
			}),
			}),
		}),
})

