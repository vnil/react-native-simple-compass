Pod::Spec.new do |s|
	s.name         = "react-native-simple-compass"
	s.version      = "1.0.0"
	s.summary      = "Simple module exposing the compass on iOS and Android"
	s.description  = <<-DESC
					A ReactNative simple module exposing the compass on iOS and Android
					DESC
	s.homepage     = "https://github.com/vnil/react-native-simple-compass"
	s.license      = { :type => "MIT", :file => "LICENSE.md" }
	s.author       = { "Viktor Nilsson" => "some.guy@internett.com" }
	s.platform     = :ios, "9.0"
	s.source       = { :git => "https://github.com/vnil/react-native-simple-compass", :tag => "master" }
	s.source_files  = "ios/**/*.{h,m}"

	s.dependency "React"
end