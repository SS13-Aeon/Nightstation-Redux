/**
 * BASE ERP PREFS OVERRIDE
 */
/datum/preference/choiced/erp_status/init_possible_values()
	return list("Check OOC", "Ask", "No", "Yes")

/**
 * SEXUALITY
 */
/datum/preference/choiced/erp_status_sexuality
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref_sexuality"

/datum/preference/choiced/erp_status_sexuality/init_possible_values()
	return list("Straight", "Gay", "Bisexual", "Pansexual", "Asexual", "None")

/datum/preference/choiced/erp_status_sexuality/create_default_value()
	return "None"

/datum/preference/choiced/erp_status_sexuality/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/choiced/erp_status_sexuality/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return "None"
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return "None"
	. = ..()

/datum/preference/choiced/erp_status_sexuality/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE


/**
 * POSITION PREFS
 */
/datum/preference/choiced/erp_status_position
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref_position"

/datum/preference/choiced/erp_status_position/init_possible_values()
	return list("Top", "Bottom", "Switch", "None")

/datum/preference/choiced/erp_status_position/create_default_value()
	return "None"

/datum/preference/choiced/erp_status_position/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/choiced/erp_status_position/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return "None"
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return "None"
	. = ..()

/datum/preference/choiced/erp_status_position/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE
