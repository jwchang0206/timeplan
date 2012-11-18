{exec} = require 'child_process'

task 'watch', 'Watch CS File Changes and Compile right away', ->
	exec 'coffee --watch --bare --compile --output lib/ src/', (err, stdout, stderr) ->
		throw err if err
