package com.dorisoft.plugin.autoComplete

import grails.converters.*

class AutoCompleteService {
	static transactional = false

	def domainService
    def grailsApplication

	def autoCompleteDomains (params) {

		if (!params.domain) throw new Exception ("domain is required")
		if (!params.searchField) throw new Exception ("searchField is required")
		if (!params.q) throw new Exception ("q is required")
		if (!params.max) throw new Exception ("max is required")
		if (!params.order) throw new Exception ("order is required")
		if (!params.collectField) throw new Exception ("collectField is required")

        params.domain = params.domain[0].toUpperCase() + params.domain.substring(1)
        def domainClass = findDomainClass(params.domain)
		if (!domainClass) throw new Exception ("Cannot find the domain class for [$params.domain] ")

		def results = domainClass?.createCriteria()?.list {
			if (params.searchField=="id") {
				idEq(new Long(params.q))
			}
			else {
				ilike (params.searchField, params.q.toString() + '%')
			}

			maxResults(Integer.parseInt(params.max,10))
			order(params.searchField, params.order)
		}

		if (results?.size()< 5){
			def c = domainClass?.createCriteria()
			def result = c.list() {
				if (params.searchField=="id") {
					idEq(new Long(params.q))
				}
				else {
					ilike params.searchField, "%${params.q}%"
				}
				maxResults(Integer.parseInt(params.max,10))
				order(params.searchField, params.order)
			}
		}

		results = results?.collect {	it."${params.collectField}" }?.unique()
		return results  as JSON
	}

    Class findDomainClass(String className){
        grailsApplication.domainClasses.find { it.clazz.simpleName == className }?.clazz
    }
}