require 'xcodeproj'

module Xcake
  module Generator
    class Target

      attr_accessor :cakefile
      attr_accessor :project

      def initialize(cakefile, project)
        self.cakefile = cakefile
        self.project = project
      end

      def build

        file_generator = File.new(cakefile, project)

        cakefile.targets.each do |t|

          puts t.name

          target = project.new(Xcodeproj::Project::Object::PBXNativeTarget)
          target.name = t.name

          file_generator.add_files(t.include_files, target)
          file_generator.remove_files(t.exclude_files, target)

          project.targets << target
        end

        file_generator.build
      end
    end
  end
end
