module Ui
  class Gtunnel
    SCRIPT_PATH = '../lib/garlicat.sh'

    def call(b32)
      pid = spawn("#{SCRIPT_PATH} #{b32}")
      Process.detach(pid)
    end
  end
end
