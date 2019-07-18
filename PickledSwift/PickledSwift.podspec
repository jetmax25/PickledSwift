#
#  Be sure to run `pod spec lint PickledSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "PickledSwift"
  spec.version      = "0.1.4"
  spec.summary      = "My shared code for pickled games"

spec.ios.deployment_target = "12.1"
spec.swift_version = "5.0"


  spec.description  = <<-DESC
                   Code that should work for all repos
            DESC

  spec.homepage     = "https://github.com/jetmax25/PickledSwift"
    spec.author             = { "Mike" => "Jetmax25@gmail.com" }


  spec.source       = { :git => "https://github.com/jetmax25/PickledSwift.git", :tag => spec.version }



  spec.source_files  = "PickledSwift/**/*.{h,m,swift}"
end
