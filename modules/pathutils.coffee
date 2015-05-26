exports.pathSeparator = '/'

exports.appendPathComponent = (path, component) ->
	if not path?
		return component ? ''
	if not component?
		return path

	pathLength = path.length
	componentLength = component.length

	if pathLength is 0
		return component
	if componentLength is 0
		return path

	#pathEndsWithFileSeparator = path.endsWith '/'
	#componentStartsWithFileSeparator = component.startsWith '/'
	pathEndsWithFileSeparator = (path.indexOf exports.pathSeparator, pathLength - 1) != -1
	componentStartsWithFileSeparator = component.slice(0, 1) is exports.pathSeparator

	if pathEndsWithFileSeparator and componentStartsWithFileSeparator
		return path.substring(0, pathLength - 1) + component
	if pathEndsWithFileSeparator or componentStartsWithFileSeparator
		return path + component
	return path + exports.pathSeparator + component
