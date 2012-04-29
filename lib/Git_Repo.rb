require "Git_Repo/version"


class Git_Repo
  
  Failed_Shell_Command = Class.new(RuntimeError)

  module Base
    
    attr_reader :address
    def initialize dir
      @address = File.expand_path(dir)
    end
    
    def init
      shell "git init"
    end
    
    def add str
      shell "git add #{str}"
    end

    def update
      add '.'
      add '-u'
    end
    
    def tag str
      shell "git tag #{str}"
    end

    def reset
      shell "git reset"
    end
    
    def commit msg
      shell "git commit -m \"#{msg.gsub(%r!\r|\n!, ' ').gsub('"', "'")}\""
    end
    
    def status
      shell "git status"
    end

    def changes_to_be_committed?
      status['Changes to be committed']
    end

    def nothing_to_commit?
      !!( status['nothing to commit (working directory clean)'] )
    end

    def commit_pending?
      !nothing_to_commit?
    end
    
    def staged?
      commit_pending?
    end
    
    def bundle_update
      shell "bundle update"
    end
     
    def shell cmd
      val = `cd #{address} && #{cmd} 2>&1`.to_s.strip
      print cmd, "\n"
      if $?.exitstatus != 0
        raise Failed_Shell_Command, "Results:\n#{val}"
      end
      print val, "\n"
      val
    end 
    
  end # === module Base
  
  include Base
  
end # === class Git_Repo
