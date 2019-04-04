module Danger
  class DangerBqHelpers < Plugin

    # all build reports
    attr_accessor :build_reports

    # all test reports
    attr_accessor :test_reports

    def scan_files
      @build_reports = []
      @test_reports = []
      Find.find("./output") do |path|
        @build_reports << path if path =~ /.*\.build-report.json$/
        @test_reports << path if path =~ /.*\.test-report.xml$/
      end
    end

    # read platform name from file
    # @return String
    def read_platform_from_file(path:)
        path.basename.to_s.split('.').first
    end

    # rewrite json report to put platform
    def label_tests_summary(path:) 
      json = File.read(path.to_s)
      data = JSON.parse(json)
      data["tests_summary_messages"].each { |message| 
          if !message.empty?
             message.insert(1, "**[" + read_platform_from_file(path: path) + "]**")
          end
      }
      File.open(path.to_s,"w") do |f|
         f.puts JSON.pretty_generate(data)
      end 
    end    
  end
end
