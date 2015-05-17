
Pod::Spec.new do |s|
  s.name             = "DXTimestamper"
  s.version          = "0.1.0"
  s.summary          = "A simple yet extensible solution to show live timestamps on iOS UI for past, present and future NSDates"
  s.description      = <<-DESC
                       DXTimestamper allows you to not only just use the readymade solution for displaying live timestamps, but also allows you to provide your own fuzzy timestamp calculation logic if you want more than what you got, out of the box.

                       * UILabel subclass to just display timestamp string.
                       * UIButton subclass to display timestamp string with image and action if you want.
                       * Ability to set custom logic for fuzzy timestamp string calculation.
                       DESC
  s.homepage         = "https://github.com/s3lvin/DXTimestamper"
  # s.screenshots     = "http://s26.postimg.org/smgiqhmw9/Timestamp.gif"
  s.license          = 'MIT'
  s.author           = { "s3lvin" => "mariaselvin@gmail.com" }
  s.source           = { :git => "https://github.com/s3lvin/DXTimestamper.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DXTimestamper' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'

end
