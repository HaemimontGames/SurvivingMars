-- register all error texts in MessageText[err] or MessageText[context][err]
-- error codes use literals: MessageText["error-code"]
-- named error texts use camel case identifiers: MessageText.ErrorCode

--[[section:errors]]
MessageTitle.Generic                      = T{6774, "Error"}
MessageText.DlcRequiresUpdate             = T{950, "Some downloadable content requires a game update in order to work."}

---[==[ remove a dash to comment out this section if not supported
-- pops - Paradox API
AddMessageContext("pops")
MessageTitle["pops"].Generic											= T{1000599, "Warning"}
MessageText["pops"].Generic             							= T{951, "Failed to complete operation."}
MessageText["pops"]["No reply"]             						= T{952, "Could not establish a connection with the Paradox server."}
MessageText["pops"]["timeout"]             							= T{952, "Could not establish a connection with the Paradox server."}
MessageText["pops"]["internal-error"]								= T{7704, "The external service responded negatively."}
MessageText["pops"]["not-authorized"]								= T{7705, "Wrong email or password."}
MessageText["pops"]["check-terms"]									= T{955, "You haven't accepted the Terms of Use and Privacy Policy."}
MessageText["pops"]["email-missing"] 								= T{956, "Please enter an email address."}
MessageText["pops"]["pass-missing"] 									= T{957, "Please enter a password."}
MessageText["pops"]["pass-mismatch"] 								= T{958, "Passwords do not match."}
MessageText["pops"]["lang-missing"] 									= T{959, "Please choose a language."}
MessageText["pops"]["country-missing"] 								= T{960, "Please choose a country."}
MessageText["pops"]["date-missing"] 									= T{961, "Please enter your date of birth."}
MessageText["pops"]["bad-password-length"] 							= T{962, "Password should be between 6 and 128 characters long."}
MessageText["pops"]["no-mixed-digits"] 								= T{7690, "Password should contain both letters and numbers."}
MessageText["pops"]["common-pass"] 									= T{7706, "Password is too common."}
MessageText["pops"]["username-in-pass"] 							= T{7691, "Password can not contain the username."}
MessageText["pops"]["invalid-email"] 								= T{963, "Please supply a valid email address."}
MessageText["pops"]["account-exists"] 								= T{964, "Account already exists."}
MessageText["pops"]["dynamodb-failure"] 							= T{965, "Could not complete operation."}
MessageText["pops"]["existing-account-to-steam-connection"] 	= T{966, "This Paradox account is already linked to another Steam account."}
MessageText["pops"]["existing-steam-to-account-connection"] 	= T{967, "This Steam account is already linked to another Paradox account."}
MessageText["pops"]["steam-offline"]									= T{7707, "Unable to get Steam authentication ticket. If Steam is running in Offline mode, go online."}
MessageText["pops"]["third-party-exception"] 						= T{968, "Problem communicating with Steam."}
MessageText["pops"]["unsupported-account-details-keys"] 			= T{969, "Supplied field keys are not supported."}
MessageText["pops"]["missing-required-account-details-keys"] 	= T{970, "One or more required keys are missing from account details."}
MessageText["pops"]["invalid-country-code"] 						= T{971, "Supplied country code is not valid - ISO 3166-1 alpha-2 code."}
MessageText["pops"]["invalid-language-code"] 						= T{972, "Supplied language code is not valid - ISO 639-1."}
MessageText["pops"]["invalid-script-code"] 							= T{973, "Supplied script is not valid - ISO 15924."}
MessageText["pops"]["invalid-ISO-8601-format"] 					= T{974, "Please enter a valid date of birth."}
MessageText["pops"]["ua"] 												= T{975, "You are not eligible to create an account."}
MessageText["pops"]["duplicate-account-to-xbox-connection"]		= T{7531, "Paradox Account is already connected to this Microsoft Account."}
MessageText["pops"]["existing-account-to-xbox-connection"]		= T{7532, "This Paradox Account is already connected to another Microsoft Account."}
MessageText["pops"]["existing-xbox-to-account-connection"]		= T{7533, "This Microsoft Account is already connected to another Paradox Account."}
MessageText["pops"]["existing-account-to-psn-connection"]		= T{7534, "This Paradox Account is already connected to another Sony<nbsp>Entertainment<nbsp>Network account."}
MessageText["pops"]["existing-psn-to-account-connection"]		= T{7535, "This Sony<nbsp>Entertainment<nbsp>Network account is already connected to another Paradox Account."}
MessageText["pops"]["duplicate-account-to-psn-connection"]		= T{7534, "This Paradox Account is already connected to another Sony<nbsp>Entertainment<nbsp>Network account."}
MessageText["pops"]["psn-not-signed-in"]								= T{8018, "Sign in to PlayStation™Network to use network features."}
MessageText["pops"]["no err"]											= T{7890, "There is no network connectivity. Please check your connection and try again."}
MessageText["pops"]["no-network"]										= T{7890, "There is no network connectivity. Please check your connection and try again."}
MessageText["pops"]["mod-editor"]										= T{8672, "This version of <em>Surviving Mars</em> doesn't yet support uploading mods you created, but you can test them in the game."}
MessageText["pops"]["mod-manager"]									= T{8673, "This version of Surviving Mars doesn't yet support downloading mods. You can, however, try the modding tools to create and load your own mods."}
MessageTitle["pops"]["new-dlc"]										= T{1000717, "New Downloadable Content"}
MessageText["pops"]["new-dlc"]										= T{1000723, "Downloadable Content has been unlocked, returning to Main Menu."}

AddMessageContext("account save")
MessageTitle["account save"].Generic									= T{1000599, "Warning"}
MessageText["account save"].Generic									= T{7844, "Failed to save your settings"}
MessageText["account save"]["orbis1gb"]								= T{7845, "There is not enough storage space. To save your settings, delete old save data."}
MessageText["account save"]["Disk Full"]							= T{7845, "There is not enough storage space. To save your settings, delete old save data."}

AddMessageContext("account load")
MessageTitle["account load"].Generic									= T{1000599, "Warning"}
MessageText["account load"].Generic									= T{7846, "Failed to load your settings."}
MessageText["account load"]["File is corrupt"]						= T{7847, "Failed to load game settings. The saved data is corrupted. This saved data will be deleted and new saved data will be created."}

AddMessageContext("savegame")
MessageTitle["savegame"].Generic										= T{1000599, "Warning"}
MessageText["savegame"].Generic										= T{4185, "Unidentified error while saving <savename>!<newline>Error code: <error_code>"}
MessageText["savegame"]["Disk Full"]									= T{7779, "There is not enough storage space. To save your progress, delete old save data."}
MessageText["savegame"]["orbis1gb"]									= T{7778, "The save data limit for this game was reached. To save your progress, delete old save data."}
MessageText["savegame"]["Sharing Violation"]						= T{8705, "You can not overwrite a savegame that is currently being uploaded."}

AddMessageContext("loadgame")
MessageTitle["loadgame"].Generic										= T{1000599, "Warning"}
MessageText["loadgame"].Generic										= T{4187, "Could not load <name>."}
MessageText["loadgame"]["File is corrupt"]							= T{4187, "Could not load <name>."} .. "<newline>" .. T{4188, "The savegame is corrupted."}
MessageText["loadgame"]["paradox sponsor"]							= T{7771, "Required content not available: Paradox Mission Sponsor. Log into your Paradox account to unlock it"}
MessageText["loadgame"]["incompatible"]								= T{8649, "Please update the game to the latest version to load this savegame."}
MessageText["loadgame"]["corrupt"]									= T{4188, "The savegame is corrupted."}

AddMessageContext("deletegame")
MessageTitle["deletegame"].Generic									= T{1000599, "Warning"}
MessageText["deletegame"].Generic										= T{4190, "Unable to delete <name>"}
--]==]

function CreateErrorMessageBox(err, context, ok_text, parent, obj)
	RecordError("msg", err, context)
	return CreateMarsMessageBox(GetErrorTitle(err, context), GetErrorText(err, context, obj), ok_text, parent, nil, obj)
end

function WaitErrorMessage(err, context, ok_text, parent, obj)
	RecordError("msg", err, context)
	return WaitMarsMessage(parent or terminal.desktop, GetErrorTitle(err, context), GetErrorText(err, context, obj), ok_text, nil, obj)
end

function GetLoadingScreenDialog()
	return GetDialog("XMarsLoadingScreen")
end