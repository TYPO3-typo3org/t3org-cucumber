module TerFileHelper

  def self.get_file(type)
    case type
      when /without TYPO3 constraint/
        'without_t3_constraint.zip'
      when /that is not a zip/
        'not_a_zip.txt'
      when /without a set version/
        'without_set_version.zip'
      when /with folder in zip/
        'with_additional_folder.zip'
      else
        raise "file with type '#{type}' is not known" unless type === ''
        'test_extension_0.0.1.zip'
    end
  end

end

World(TerFileHelper)
