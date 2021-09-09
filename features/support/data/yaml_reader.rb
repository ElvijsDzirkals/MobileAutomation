require 'yaml'

module TestData
  @path = "features/support/data/"
  USERS = YAML.load_file(@path+"users.yml")
end