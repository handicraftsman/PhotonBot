module App
  module Conf
    def self.parse!
      RG::Log.write "PhotonBot: Parsing ./servers.yaml"
      YAML.load_file "./servers.yaml"
    end
  end
end