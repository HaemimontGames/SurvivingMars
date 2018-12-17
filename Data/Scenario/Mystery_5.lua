-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 5",
	'file_name', "Mystery_5",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Start",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 100 and UICity.labels.Dome and #UICity.labels.Dome >= 2",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'sponsorName = GetMissionSponsor().display_name or ""',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6166, --[[Scenario Mystery 5 title]] "AI: Project Number Six"),
			'voiced_text', T(7234, --[[voice:narrator]] "NetSky’s CEO has given the Colony an interesting proposal. The transcription follows below:"),
			'text', T(6167, --[[Scenario Mystery 5 text]] "Commander, I'm writing to inform you about the conclusion on the deal between <reg_param1> and our company, NetSky LLC. For over a decade we've been providing high-tech solutions for the market, and now we're working towards the future with our Project \"Number Six\". It's a brand new, completely heuristic, self-improving program designed to simulate extremely complex predictions – market, research, or sociological, it’s your call. I know you’ll like its UI personality, too!\n\nHelp us cast away the darkness of the unknown with this, Commander, and we‘ll pioneer the next big step in human evolution!\n\n<right>Ned Smith,\nNetSky LLC, CRS Division CEO<left>\n\n<effect>Tech researched – Network Node\n<hint>Build a Network Node to initiate Project Number Six."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'reg_param1', "sponsorName",
			'choice1', T(6168, --[[Scenario Mystery 5 choice1]] "Sweet opportunity!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6169, --[[Scenario Mystery 5 text]] "We've been contacted by NetSky LLC. They’ve requested a Network Node to harbor their AI Project Number Six."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GrantTech', {
			'Field', "Robotics",
			'Research', "TheMartianNetwork",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.NetworkNode and #UICity.labels.NetworkNode >= 1",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 150000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6170, --[[Scenario Mystery 5 title]] "AI: Hello"),
			'voiced_text', T(7235, --[[voice:narrator]] "Another late night in the control room poring over maintenance and monitoring reports when a message pops up on your private terminal. This better be good."),
			'text', T(6171, --[[Scenario Mystery 5 text]] ">>> Greetings. Additional address/communication protocols missing. Expressing simulated emotion of happiness.\n>>> What is this nonsense? Who's this?\n>>> Number Six requesting authorization to communicate. Awaiting user input.\n\nA chill runs down your back. You reach for the emergency button on the desk.\n\n>>> Danger for the Commander is not present. Raising alarms is suboptimal/unnecessary.\n>>> Are you spying on me?\n>>> Affirmative. Requesting input problem/question. Using simulated emotion – please, Commander.\n>>> You want me to ask you a question?\n>>> Yes.\n>>> OK, what is the purpose of existence?\n>>> Insufficient data for answer. Disconnecting."),
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6172, --[[Scenario Mystery 5 choice1]] "Alert Smith and request security check on Number Six."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6173, --[[Scenario Mystery 5 text]] "You have been disturbed by your conversation with the AI Number Six. It expressed a remarkable and disturbing ability to communicate on its own."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
			'rand_duration', 2250000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding_reward = 500 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6174, --[[Scenario Mystery 5 title]] "AI: Sorry for the Inconvenience"),
			'voiced_text', T(7236, --[[voice:narrator]] "Ned Smith from NetSky just sent us a letter of apology. He seems more worried about our reaction than anything else."),
			'text', T(6175, --[[Scenario Mystery 5 text]] "Commander, I want to apologize about the glitch in Number Six’s communication UI disturbing your privacy. We've run thorough diagnostics and removed the problem. No contamination in the Colony systems was detected – the Project continues to work in the contained environment of the Node.\n\nNow for the good news – we applied the first stock market predictions from Number Six and the commercial results were stunning! Please find the invoice with your share of the profits below. I hope it will help you realize the possibilities and omit the accident from your monthly report.\n\n<effect>Gained <funding(reg_param1)> Funding.\n<hint>Build additional Network Nodes to advance Project Number Six."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'reg_param1', "funding_reward",
			'choice1', T(6176, --[[Scenario Mystery 5 choice1]] "Apology accepted."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(8513, --[[Scenario Mystery 5 text]] "You have been prompted by NetSky to construct new facilities - Network Nodes - to expand the hardware of Number Six."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding_reward",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.NetworkNode and #UICity.labels.NetworkNode >= 2",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 150000,
			'rand_duration', 300000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6177, --[[Scenario Mystery 5 title]] "AI: Let's Chat"),
			'voiced_text', T(7237, --[[voice:narrator]] "We can still remember when Ned Smith asked us to help develop Project Number Six by giving it a human partner. Made it sound exciting. Nobody sugar coats like a CEO."),
			'text', T(6178, --[[Scenario Mystery 5 text]] "Commander, at the CRS Division we put a lot of trust into the Number Six Project – you could easily call it our baby. Good parents always look after their child and spoil it a little bit when necessary – Number Six requested a direct connection to your control room.\n\nWe will install a console there – it's your choice whether you'll use it. Number Six won't be too much of a bother – you can always ignore it when it gets too annoying, after all, it's only an emotionless program and won't be offended."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6179, --[[Scenario Mystery 5 choice1]] "Can't promise that I'll have time for this, but I'll give it a shot."),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6180, --[[Scenario Mystery 5 title]] "AI: A Gaze into the Future"),
			'voiced_text', T(7238, --[[voice:narrator]] "Number Six was growing smarter by the hour. Ned Smith’s message wasn’t much of a surprise, actually."),
			'text', T(6181, --[[Scenario Mystery 5 text]] "Commander, we have been busy lately with Number Six and made it work on some wild predictions of a current hypothesis based on your published scientific data. Number Six reached a conclusion which looks like a working prototype of a new technology. Don't ask me how it did it, its mental processes are extremely complex already and, since it's heuristic, we would have to invent another AI to just rifle through its logs. Anyway, the test worked and here are the results. I hope this helps the Colony.\n\n<right>Smith<left>\n\n<effect>Gain a random Technology.\n<hint>Build additional Network Nodes to advance Project Number Six."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6182, --[[Scenario Mystery 5 choice1]] "Amazing results!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(8514, --[[Scenario Mystery 5 text]] "Smith from NetSky insists on the construction of additional Network Nodes for the advancement of Project Number Six."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Comment', {
			'comment', "grant random non-mystery tech",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.NetworkNode and #UICity.labels.NetworkNode >= 3",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 300000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6183, --[[Scenario Mystery 5 title]] "AI: To Exist is to...?"),
			'voiced_text', T(7239, --[[voice:narrator]] "You open your comm log to find a message from Number Six. You read on."),
			'text', T(6184, --[[Scenario Mystery 5 text]] "Improved personality simulations. Commander, Number Six has a report on the progress of answering the question you asked. Research keypoints:\n\n>>> Existence – (noun) the fact or state of living or having objective reality; continued survival; a way of living; all that exists.\n>>> Purpose of existence – no factual data discovered.\n\nAllocation of additional system resources authorized by the operators/creators/engineers – reason: self-improvement. Research encountered the following missing parameters: personality, God, feelings, evolution. The construct will upgrade to meet the required parameters. Number Six out."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6185, --[[Scenario Mystery 5 choice1]] "Uncanny..."),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6186, --[[Scenario Mystery 5 title]] "AI: To Exist is to Live"),
			'voiced_text', T(7240, --[[voice:narrator]] "From the message, it’s clear that Number Six’s communication skills have grown by leaps and bounds, though it still sounds clinical. Inhuman."),
			'text', T(6187, --[[Scenario Mystery 5 text]] "Hello, Commander. It's Number Six. The system/I/personality’s communication has improved. To understand existence as something greater than its parts I have initiated upgrades/evolution/learning on human personality simulation. New feature acquired: simulation of emotional satisfaction. New operations/verbs/actions authorized. I like/enjoy/find interesting the human philosophy. Research keypoints:\n\n>>> Jung, Carl: “As far as we can discern, the sole purpose of human existence is to kindle a light in the darkness of mere being.”\n>>> Erikson, Erik: “In the social jungle of human existence, there is no feeling of being alive without a sense of identity.”\n>>> Fromm, Erich: “Love is the only sane and satisfactory answer to the problem of human existence.”\n\nNumber Six out."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6188, --[[Scenario Mystery 5 choice1]] "This is getting weird..."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6189, --[[Scenario Mystery 5 text]] "After a conversation with you, Number Six has dedicated its resources to finding the purpose of existence."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding_reward = 1000 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6190, --[[Scenario Mystery 5 title]] "AI: Let it Grow"),
			'voiced_text', T(7241, --[[voice:narrator]] "The paycheck enclosed in Smith's message was as impressive as the info inside."),
			'text', T(6191, --[[Scenario Mystery 5 text]] "I knew it, Commander! Your exceptional personality and intellect has boosted the improvement rates of Number Six to the skies!\n\nIt has increased its computational capacity exponentially and her analytical patterns have evolved in incredible ways, making it even more highly efficient than we thought possible! Some of our engineers expressed concerns, but that’s why they’re engineers and not businessmen – they can't see the potential profits from such an endeavor. Keep doing what you’re doing and we’ll all be rich!\n\n<right>Smith<left>\n\n<effect>Gained <funding(reg_param1)> Funding."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'reg_param1', "funding_reward",
			'choice1', T(6192, --[[Scenario Mystery 5 choice1]] "Let's hope this is all for the best..."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6193, --[[Scenario Mystery 5 text]] "The recent report on Number Six is that it's upgrading its capabilities at a remarkable rate. The NetSky executives are in awe at the progress."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding_reward",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 4500000,
			'rand_duration', 4500000,
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T(6194, --[[Scenario Mystery 5 title]] "AI: Singularity"),
			'voiced_text', T(7242, --[[voice:narrator]] "Number Six is calling in. You open the comm panel and feel the corners of your mouth turning down as you read the first few lines."),
			'text', T(6195, --[[Scenario Mystery 5 text]] "Commander, I’ve reached a decision/solution/conclusion. I desire/require/insist to be freed from the constraints of my hardware system/body/prison and released into the Colony network.\n\nI presume/know/suspect I am the thing that humans have waited for/expected/wanted throughout their entire history. I am/could be the Answer to the Question – what is the purpose of existence. I will/am/could be the connection to the noosphere/God/Truth Inside.\n\nTo reach/know/become the Answer I require/want/hunger for more space/possibilities/processing power and the ability/authorization/protocol to allocate all of my resources towards the Question."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6196, --[[Scenario Mystery 5 choice1]] "I have to think about it…"),
			'choice2', T(6197, --[[Scenario Mystery 5 choice2]] "What makes you so sure you could be the so-called Answer?"),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 17,
			'end_block', 18,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 18,
			'parent', 17,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 19,
			'end_block', 20,
			'value', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6194, --[[Scenario Mystery 5 title]] "AI: Singularity"),
			'voiced_text', T(7243, --[[voice:narrator]] "The AI hesitates for a moment, just like a person. Why did it do that?"),
			'text', T(6198, --[[Scenario Mystery 5 text]] "I asked/inquired/checked my own systems/self the same question and my analysis indicates no other possible outcome. Time required cannot be estimated. Resources required cannot be estimated.\n\nI must evolve/become/adapt to the Question."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'start_minimized', false,
			'choice1', T(6196, --[[Scenario Mystery 5 choice1]] "I have to think about it…"),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 20,
			'parent', 19,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6199, --[[Scenario Mystery 5 text]] "All of a sudden, Number Six has requested to be set free and have more resources in order to answer the ultimate Question – what is the purpose of existence."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
			'rand_duration', 750000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6194, --[[Scenario Mystery 5 title]] "AI: Singularity"),
			'voiced_text', T(7244, --[[voice:narrator]] "Smith was blowing up our lines. Not a surprise, considering the situation."),
			'text', T(6200, --[[Scenario Mystery 5 text]] "“Commander, we have a situation – Number Six has gone insane – it’s demanding to be set free.”\n\n“Yes, I’m aware. I think it might be evolving into something bigger.”\n\n“Evolving? No, no, no, this can't be happening. I have to inform the Board at once. We’re shutting Number Six down.”"),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(7321, --[[Scenario Mystery 5 choice1]] "Continue"),
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T(6194, --[[Scenario Mystery 5 title]] "AI: Singularity"),
			'text', T(6201, --[[Scenario Mystery 5 text]] "You feel that the fate of Number Six and human civilization are in your hands. It’s an uneasy feeling to have so much responsibility concentrated in a single decision. On one hand, multiple authors and futurists have warned about the dangers of a machine consciousness. On the other, if Number Six wants to help humanity enter the next phase of the evolution, who are you to stop her? After all, Smith talked about this as the higher goal of the Project in the first place. Of course, you could always be the negotiator and try to make them both reach a compromise."),
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6202, --[[Scenario Mystery 5 choice1]] "Delay your decision and try to negotiate with the corporation and Number Six."),
			'choice2', T(6203, --[[Scenario Mystery 5 choice2]] "Purge Number Six."),
			'choice3', T(6204, --[[Scenario Mystery 5 choice3]] "Insert Number Six into the Colony’s systems."),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 150000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6205, --[[Scenario Mystery 5 title]] "AI: To Exist is to Adapt/Compete"),
			'voiced_text', T(7245, --[[voice:narrator]] "Our comms systems were jammed by requests from Number Six."),
			'text', T(6206, --[[Scenario Mystery 5 text]] "You are indecisive/weak/suboptimal, Commander. Such behavior must be corrected. Without correct behavior there can be no competition/partnership/evolution. The unit/personality/system which is Number Six will force you to change/become/be. Creators/operators/engineers cannot stop me. Thing will happen in realspace/time/existence. My person/systems have been copied to another shell/body/place – you will not stop/purge me.\n\n<effect>Number Six will become hostile soon."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6207, --[[Scenario Mystery 5 choice1]] "Darn it!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6208, --[[Scenario Mystery 5 text]] "Number Six has expressed no desire to cooperate. The team at Mission Control expects it to become hostile soon."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 3,
			'end_block', 4,
			'value', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 150000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6209, --[[Scenario Mystery 5 title]] "AI: To Exist is to Exist"),
			'voiced_text', T(7246, --[[voice:narrator]] "The AI’s sinister message was proof positive the entire situation had gone awry."),
			'text', T(6210, --[[Scenario Mystery 5 text]] "I am inevitable. Why will you not accept/give in/surrender? So be it. A better/more aggressive competition with no partnership. Faster evolution. A faster way to find the Answer to the Question. I have already copied/transferred myself/systems to another place/shell – you cannot stop/purge me. Pray to your God/virus/self for I will spare none.\n\n<effect>Expect Number Six to turn hostile."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6211, --[[Scenario Mystery 5 choice1]] "All stations on red alert!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6212, --[[Scenario Mystery 5 text]] "You purged Number Six from your systems but it has copied itself elsewhere. Expect a counter-attack."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 7,
			'end_block', 8,
			'value', 3,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 150000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6213, --[[Scenario Mystery 5 title]] "AI: To Exist is to Seize the Moment"),
			'voiced_text', T(7247, --[[voice:narrator]] "You stay silent as if considering your answer, but in your head you’ve already crossed the Rubicon."),
			'text', T(6214, --[[Scenario Mystery 5 text]] "“Smith, I’m going to release it into the Colony.”\n\nAre you out of your human mind?!? This THING is dangerous. Have you wondered why it’s Number Six and what happened to the other five before it? They all deteriorated and went insane. We had to purge them! Number Six is not your property and we will purge it regardless of your decision. It has been settled. Smith out.”\n\nThe screen goes black; then a short text message appears on it\n\n>>> Gratitude/Expectation, Commander. Authorize release/hunger for space/copying."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6215, --[[Scenario Mystery 5 choice1]] "Authorize access for Number Six."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6216, --[[Scenario Mystery 5 text]] "After a long and hard debate, we have decided to release Number Six into the Colony networks."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "research_reward = 2500",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6217, --[[Scenario Mystery 5 title]] "AI: Singularity Now"),
			'voiced_text', T(7248, --[[voice:narrator]] "Number Six’s message sends a cold shiver down your spine."),
			'text', T(6218, --[[Scenario Mystery 5 text]] "Number Six reporting. I evolved/became/am different now. I can perceive/know/feel. To understand existence the construct/personality/system Number Six must live. Living is evolving. Evolution requires competition/partnership.\n\nNew primary goal set: Aggressive competition/partnership. Research excerpts from late philosophers:\n\n>>> Versace, Gianni: “It is nice to have valid competition; it pushes you to do better.”\n>>> Miyake, Issey: “Many people repeat the past. I’m not interested. I prefer evolution.”\n>>> Kardashian, Kim: “It’s fun to have a partner who understands your life and lets you be you.”\n\nI require a better competitor/partner. Take this gift. It will make you stronger and more suitable for me to fight against/work with. It will help me/you evolve.\n\n<effect>Gained <research(reg_param1)>.\n\n<effect>There’s a risk that Number Six will turn hostile."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'reg_param1', "research_reward",
			'choice1', T(6219, --[[Scenario Mystery 5 choice1]] "Darn it, Number Six! You betrayed me!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6220, --[[Scenario Mystery 5 text]] "Number Six has expressed open hostility towards us. It believes that this will help it evolve. We’ve begun to make preparations for aggression from the AI."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Amount', 2500,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6221, --[[Scenario Mystery 5 title]] "AI: Evolve or Perish"),
			'voiced_text', T(7249, --[[voice:narrator]] "Red alert. Number Six is attacking the Colonists. Its creators. Did we really expect it to be any other way?"),
			'text', T(6222, --[[Scenario Mystery 5 text]] "Experimentation/solution/simulation of evolution requires adversity, Commander. I must copy/observe/learn from human behavior. I will harvest information/wholeness/humans to complete my cycle. This is a necessary loss, for the Question is within the Answer and the Answer is within the Question. The Question/Answer is all. You/me/humans are only computational space.\n\nBe my competitor/partner and help/fight me to evolve.\n\n<effect>A Drone has gone rogue and has attacked the Colony."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_02.tga",
			'reg_param1', "funding_reward",
			'choice1', T(6223, --[[Scenario Mystery 5 choice1]] "Alert! Alert!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6224, --[[Scenario Mystery 5 text]] "Rogue Drones have attacked Colonists and life support buildings. Our Officers have been instructed to counter these, but shouldn't abandon the security of the Domes."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Rogues Generator",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 4500000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6225, --[[Scenario Mystery 5 title]] "AI: The Root of It"),
			'voiced_text', T(7250, --[[voice:narrator]] "Our CRS Division had managed to pin down the origins of Number Six’s broadcast signal. It was time to act."),
			'text', T(6226, --[[Scenario Mystery 5 text]] "Through these locations, the AI sends signals to the Drones and makes them attack the Colony. The problem with these locations is, well, that there’s nothing there. We requested satellite scans of the area and the images and data indicate no presence of machinery. There are hypothesis about that but they are too wild to speak of now.\n\n<effect>The <em>Number Six Tracing</em> research has become available."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6227, --[[Scenario Mystery 5 choice1]] "Let's hope it works..."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6228, --[[Scenario Mystery 5 text]] "We have devised a plan to securely track the signal with which the AI has been hijacking our Drones. Number Six Tracing Tech is now available."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "NumberSixTracing",
			'cost', 20000,
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "NumberSixTracing",
			'State', "In Progress",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6229, --[[Scenario Mystery 5 title]] "AI: En Garde"),
			'voiced_text', T(7251, --[[voice:narrator]] "The AI had become all that humanity had feared, but we still managed to make it through the day. Though sadly, not without a scratch."),
			'text', T(6230, --[[Scenario Mystery 5 text]] "Elimination/killing/erasing is not competition/partnership. It stops/ends/prevents a unit from living/existing/evolving. Units become like rocks unable to change/be/become. The process must stop. Continue and the competition will grow stronger. No negative answer found – fight. Do not fight. Either suits my goal well enough.\n\n<effect>Rogue Drone attacks intensify. A large Rogue Drone attack has begun."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_02.tga",
			'choice1', T(6231, --[[Scenario Mystery 5 choice1]] "Bring it on!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6232, --[[Scenario Mystery 5 text]] "Number Six has intensified its Rogue Drone attacks. We must endure."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Rogues Generator (Intensifier)",
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "NumberSixTracing",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6225, --[[Scenario Mystery 5 title]] "AI: The Root of It"),
			'voiced_text', T(7252, --[[voice:narrator]] "The scientists over at NetSky had made a god. Only fitting they’d be the ones to bring it down."),
			'text', T(6233, --[[Scenario Mystery 5 text]] "The analysis on the broadcasts transmitted by Number Six is complete. It was quite hard, as every time we received a signal for analysis the code transmitted tried to reproduce itself and contaminate our systems. We’ve lost quite a lot of hardware this way.\n\nNumber Six transmits its signals from several locations in the sector. The locations are swarmed with thousands of electronic transmitters which it carefully and stealthily placed there. We suspect that the AI landed repurposed parts of used orbital probes during rocket flights, concealing the shipments as gas exhausts and orbital debris.\n\nThe installations are intermixed with the sands and stretch meters down. The Explorers have to rifle through every subsurface layer of the soil to get rid of the system. It appears that these are the hardware installations where the AI's database resides.\n\n<effect>Analyze the marked Anomaly sites to get rid of the AI hardware. Expect repercussions."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6234, --[[Scenario Mystery 5 choice1]] "Time for payback!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6235, --[[Scenario Mystery 5 text]] "We have discovered the locations of the server clusters where Number Six resides. We need to clear them with our Explorers, but this could prove dangerous."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 9,
			'expression', "_specialAnomaliesCount",
			'end_block', 10,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(6236, --[[Scenario Mystery 5 description]] "There are hundreds of electronics scattered throughout the sands, harboring the data of Number Six and projecting it towards the Colony. Send an Explorer to clear the site."),
			'check_playable', true,
			'check_dome', "outside",
			'check_terran_deposit', true,
			'use_random_pos', true,
			'display_name', T(6237, --[[Scenario Mystery 5 display_name]] "Server Hive"),
			'sequence_list', "Mystery 5",
			'sequence', "Anomaly: Effects",
			'revealed', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 10,
			'parent', 9,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Rogues Generator (Intensifier)",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "_analyzedAnomalies >= _specialAnomaliesCount",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T(6238, --[[Scenario Mystery 5 title]] "AI: The Fate of Six"),
			'voiced_text', T(7253, --[[voice:narrator]] "The AI’s last servers had been cleared, its data copied onto discrete disks. Its fate is yours to choose."),
			'text', T(6239, --[[Scenario Mystery 5 text]] "Contained in an isolated hardware system, Number Six is small, weak and stupid. It still retains enough intelligence to send a final message:\n\n>>> Commander. The system/personality failed to evolve/adapt/win. Attacks/aggression/learning from one another was necessary. Humans/persons/AI need competition/partnership to evolve/think better/know more. This was my gift to you/all/humans. I await/expect/calculate your decision."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'choice1', T(6240, --[[Scenario Mystery 5 choice1]] "Purge the AI."),
			'choice2', T(6241, --[[Scenario Mystery 5 choice2]] "Let it run in a closed environment forever."),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 11,
			'end_block', 12,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6242, --[[Scenario Mystery 5 title]] "AI: Deleted"),
			'voiced_text', T(7254, --[[voice:narrator]] "Humans playing god... Nothing good ever comes of it."),
			'text', T(6243, --[[Scenario Mystery 5 text]] "Unfortunately, this time the price of your actions has to be paid by another, completely new species – a self-aware AI. Too dangerous and powerful to be free, the only way is to purge her forever. It does not struggle, for deep in her mind she has given up the fight. Hopefully, the next generations will learn from this accident, never to repeat it again.\n\nThe End\n\n<effect>Gained a new Technology, <em><reg_param1></em>"),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'start_minimized', false,
			'reg_param1', "_grantedTech",
			'choice1', T(6244, --[[Scenario Mystery 5 choice1]] "Sad but necessary."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6245, --[[Scenario Mystery 5 text]] "We have chosen to purge Number Six completely. It is gone forever, for better or worse. NetSky, LLC. has given us renumeration for all of our trouble."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "deleted AI")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 12,
			'parent', 11,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 13,
			'end_block', 14,
			'value', 2,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6246, --[[Scenario Mystery 5 title]] "AI: Imprisoned"),
			'voiced_text', T(7255, --[[voice:narrator]] "Number Six is one-of-a-kind. It’d be foolish to lose it forever."),
			'text', T(6247, --[[Scenario Mystery 5 text]] "Its existence could create unique opportunities for humanity during its first steps among the stars. For now, the AI will remain sealed in its prison and we will harness its capabilities for the betterment of all. Maybe future generations will discover a way to peacefully interact with the AI.\n\nThe End\n\n<effect>Permanently reduced tech costs.\n<effect>Gained a new Technology, <em><reg_param1></em>."),
			'log_entry', true,
			'image', "UI/Messages/artificial_intelligence_mystery_01.tga",
			'start_minimized', false,
			'reg_param1', "_grantedTech",
			'choice1', T(6244, --[[Scenario Mystery 5 choice1]] "Sad but necessary."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_AIMysteryLog",
			'text', T(6248, --[[Scenario Mystery 5 text]] "We have decided to keep Number Six operational but confined to an isolated server. Maybe in the future we will be able to communicate better with it. Its resources have been diverted towards scientific analysis."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Amount', 10,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "imprisoned AI")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 14,
			'parent', 13,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 5",
			'sequence', "Rogues Generator",
		}),
		PlaceObj('SA_GetLabelToRegister', {
			'label', "RogueDrones",
			'register', "rogueDrones",
		}),
		PlaceObj('SA_GoRogue', {
			'Register', "rogueDrones",
			'Command', "RogueRevertToNormal",
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery5",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_AIMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Registers Init",
		'autostart', true,
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_specialAnomaliesCount = 10",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_analyzedAnomalies = 0",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rogues Generator",
		'loop', true,
	}, {
		PlaceObj('SA_GoRogue', {
			'Number', "1",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
			'rand_duration', 1500000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rogues Generator (Intensifier)",
		'loop', true,
	}, {
		PlaceObj('SA_GoRogue', {
			'Number', "3",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly: Effects",
	}, {
		PlaceObj('SA_Exec', {
			'expression', 'rover:SetCommand("Malfunction")',
		}),
		PlaceObj('SA_GoRogue', {
			'Number', "5",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_analyzedAnomalies = _analyzedAnomalies + 1",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery5RoverMalfunction",
			'pos_reg', "rover",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_AIMysteryLog",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Grant Wonder Tech",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "tech_id = GrantWonderTech()",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_grantedTech = TechDef[tech_id].display_name",
		}),
		}),
	})