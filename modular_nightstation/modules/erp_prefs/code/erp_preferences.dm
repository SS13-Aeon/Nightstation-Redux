/datum/preference/choiced/erp_status_sexuality
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref_sexuality"

/datum/preference/choiced/erp_status_sexuality/init_possible_values()
	return list("Straight", "Gay", "Blowjob")

/datum/preference/choiced/erp_status_sexuality/create_default_value()
	return "Blowjob"

/datum/preference/choiced/erp_status_sexuality/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/choiced/erp_status_sexuality/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return "Blowjob"
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return "Blowjob"
	. = ..()

/datum/preference/choiced/erp_status_sexuality/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE
