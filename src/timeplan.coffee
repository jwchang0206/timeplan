timeParser = (str) ->
	timeUnits =
		year:
			patterns: [
				"year"
				"years"
				"Y"
			]
			period: 365 * 24 * 60 * 60 * 1000
		
		month:
			patterns: [
				"month"
				"months"
				"M"
			]
			period: 30 * 7 * 24 * 60 * 60 * 1000

		week:
			patterns: [
				"week"
				"weeks"
				"W"
			]
			period: 7 * 24 * 60 * 60 * 1000

		day:
			patterns: [
				"day"
				"days"
				"D"
			]
			period: 24 * 60 * 60 * 1000

		hour:
			patterns: [
				"hour"
				"hours"
				"h"
			]
			period: 60 * 60 * 1000

		minute:
			patterns: [
				"minute"
				"minutes"
				"m"
			]
			period: 60 * 1000

		second:
			patterns: [
				"second"
				"seconds"
				"s"
			]
			period: 1000

	number = parseFloat str.replace(/[a-zA-Z]+/g, "").trim()
	unit = str.replace(/[^a-zA-Z]+/g, "").trim()

	for key in Object.keys timeUnits
		if unit in timeUnits[key].patterns
			return timeUnits[key].period * if number > 0 then number else 1

module.exports =
	delayed: (options) ->
		if options?.task? and options?.period? and typeof options.task is "function"
			period = timeParser options.period
			setTimeout ->
				process.nextTick -> options.task()
			, period
	
	repeat: (options) ->
		if options?.task? and options?.period? and typeof options.task is "function"
			period = timeParser options.period
			process.nextTick -> options.task()
			setInterval ->
				process.nextTick -> options.task()
			, period