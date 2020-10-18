module Ui
  Host = Struct.new(:ip, :b32) do
    def to_s
      "#{ip} #{b32}"
    end
  end

  class Hosts
    HOSTS_FILE = 'hosts.gc'

    def current
      list.first
    end

    def any_remote?
      list.size > 1
    end

    def list
      File
        .readlines("../#{HOSTS_FILE}")
        .reject { |line| line.start_with?('#') }
        .map(&:strip)
        .map { |line| Host.new(*line.split(' ')) }
    end

    def add(ip, b32)
      open("../#{HOSTS_FILE}", 'a') do |f|
        f.puts "#{ip} #{b32}"
      end
    end
  end
end
