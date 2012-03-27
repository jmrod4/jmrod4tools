CONTENTS: hints on using ruby libraries, gems, etc.



LOGGER
------

Severity levels:

 DEBUG < INFO < WARN < ERROR < FATAL < UNKNOWN

Use logger with a custom format:

	require 'logger'

	logger = Logger.new(STDERR)
	#logger = Logger.new(STDOUT)
	#logger = Logger.new('mylog.log')
	#logger = Logger.new(File.basename(__FILE__, ".rb") + ".log")
	#logger = Logger.new(File.basename(__FILE__, File.extname(__FILE__)) + ".log")
	#logger = Logger.new('mylog.log', 10, 1024*1000)	
	#logger = Logger.new(open('mylog.log', File::WRONLY | File::APPEND | File::CREAT))
	
	# default
	logger.level = Logger::DEBUG
	#logger.level = Logger::INFO
	#logger.level = Logger::WARN

	# default
	logger.progname = nil
	#logger.progname = File.basename(__FILE__)
	#logger.progname = 'main'

	
	
	# just to show how, shows same msg as default
	logger.datetime_format = "%Y-%m-%dT%H:%M:%S.%6N "
	
	
	# just to show how, shows same msg as default, another method
	formatter = Logger::Formatter.new
	formatter.datetime_format = "%Y-%m-%dT%H:%M:%S.%6N "
	logger.formatter = formatter

	
	# just to show how, shows same msg as default
	logger.formatter = lambda { |severity, datetime, progname, msg|
	  "%s, [%s #%s]  %s -- %s: %s\n" % [
		severity[0,1],
		datetime.strftime("%Y-%m-%dT%H:%M:%S.%6N "),
		$$,
		severity, 
		progname, 
		msg
	  ]
	}

	
	# just to show how, shows same msg as default, another method
	original_formatter = Logger::Formatter.new
	logger.formatter = proc { |severity, datetime, progname, msg|
	  original_formatter.call(severity, datetime, progname, msg.dump)
	}	
	
	logger.debug("Created logger")
	logger.info("Program started")
	logger.warn("Nothing to do!")
	
	# same but not evaluated if not logged
	logger.debug { "Created logger" }
	logger.info {"Program started" }
	logger.warn { "Nothing to do!" }
	
	# including a progname
	logger.info('myfunc') { "Something %s has happend " % ["wonderful"] }
	
	# if needed it can be closed
	logger.close
	
	
	
Use logger as an application capsule :)


	require 'logger'

	class FooApp < Logger::Application
	  def initialize(foo_app, application_specific, arguments)
		super(foo_app) # Name of the application.
	  end

	  def run
		#...
		log(WARN, "my warning in %s" % ['my_method1'])
		#...
		@log.error('my_method2') { 'Error!' }
		#...
	  end
	end

	status = FooApp.new('FOOAPP', "kk", ARGV).start
	puts "Exited with status #{status}"