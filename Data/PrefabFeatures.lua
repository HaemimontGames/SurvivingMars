-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

ClearPrefabFeatures()

PrefabFeatures = {
	PlaceObj('PrefabFeature', {
		'id', "Gully",
		'color', RGBA(255, 64, 0, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 80,
			'DepositResource', "Water",
		}),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 50,
			'DepositLayer', "terr",
			'DepositResource', "Concrete",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Beauty",
		'color', RGBA(231, 73, 196, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "BeautyEffectDeposit",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Lava Coils",
		'color', RGBA(52, 187, 136, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositResource', "PreciousMetals",
		}),
		PlaceObj('PrefabFeatureChar_RepulseDeposits', {
			'DepositLayer', "terr",
			'DepositResource', "Concrete",
			'RepulseDist', 10000,
		}),
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "ResearchEffectDeposit",
		}),
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "BeautyEffectDeposit",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Dust Devils",
		'color', RGBA(151, 127, 82, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositLayer', "surf",
			'DepositResource', "Metals",
		}),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 50,
			'DepositResource', "Metals",
		}),
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "ResearchEffectDeposit",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "CO2 Jets",
		'color', RGBA(47, 213, 240, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Geyser', nil),
		PlaceObj('PrefabFeatureChar_RepulseDeposits', {
			'DepositLayer', "subs",
			'RepulseDist', 6400,
		}),
		PlaceObj('PrefabFeatureChar_RepulseDeposits', {
			'DepositLayer', "surf",
			'DepositResource', "Metals",
			'RepulseDist', 3200,
		}),
		PlaceObj('PrefabFeatureChar_RepulseDeposits', {
			'DepositLayer', "terr",
			'RepulseDist', 12800,
		}),
		PlaceObj('PrefabFeatureChar_Anomaly', nil),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositLayer', "surf",
			'DepositResource', "Polymers",
		}),
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "ResearchEffectDeposit",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Rocky Terrain",
		'color', RGBA(116, 61, 61, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositResource', "Metals",
		}),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositResource', "PreciousMetals",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Flat Lands",
		'color', RGBA(136, 163, 108, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 60,
			'DepositLayer', "terr",
			'DepositResource', "Concrete",
		}),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 40,
			'DepositLayer', "surf",
			'DepositResource', "Metals",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Low Lands",
		'color', RGBA(255, 0, 0, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositResource', "Water",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "High Lands",
		'color', RGBA(255, 255, 255, 255),
	}, {
		PlaceObj('PrefabFeatureChar_RepulseDeposits', nil),
		PlaceObj('PrefabFeatureChar_RepulseDeposits', nil),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Crater",
		'color', RGBA(246, 198, 54, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'DepositResource', "Metals",
		}),
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 50,
			'DepositLayer', "surf",
			'DepositResource', "Metals",
		}),
		}),
	PlaceObj('PrefabFeature', {
		'id', "Cold Area",
		'color', RGBA(146, 200, 232, 255),
	}, {
		PlaceObj('PrefabFeatureChar_Deposit', {
			'Weight', 120,
			'DepositResource', "Water",
		}),
		PlaceObj('PrefabFeatureChar_Effect', {
			'EffectType', "ResearchEffectDeposit",
		}),
		}),
	}