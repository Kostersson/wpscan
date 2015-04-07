# encoding: UTF-8

class WpVersion < WpItem
  module Output

    def output(verbose = false)
      puts
      puts "<wpversion category=\"info\" data=\" WordPress version #{self.number} identified from #{self.found_from}\"></wpversion>"

      vulnerabilities = self.vulnerabilities

      unless vulnerabilities.empty?
        puts "<vulnerabilitie category=\"critical\" data=\"#{vulnerabilities.size} vulnerabilities identified from the version number\"></vulnerabilitie>"

        vulnerabilities.output
      end
    end

  end
end
