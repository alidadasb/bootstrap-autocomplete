package com.dorisoft.plugin.autoComplete

/**
 * @artifact.name @
 * Purpose:
 *
 * @author Alidad Soleimani
 * @version 1.0 08/01/2012
 */
class AutoCompleteController {
    def autoCompleteService

    def searchDomain = {
        log.debug params
        render autoCompleteService.autocompleteDomains(params)
    }

}