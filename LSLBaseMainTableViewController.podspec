#
#  Be sure to run `pod spec lint LSLBaseMainTableViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "LSLBaseMainTableViewController"
s.version      = "0.0.2"
s.summary      = "initilize tableView cell"

s.homepage     = "https://github.com/maybenai/LSLBaseCellModel"

s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

s.author             = { "maybenai" => "1014720511@qq.com" }


s.platform     = :ios, "8.0"

s.source       = { :git => "https://github.com/maybenai/LSLBaseCellModel.git", :tag => "0.0.2" }

s.source_files  = "LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewContoller/**/*"

s.requires_arc = true

#s.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewContoller/LSLHeaderFiles.h'


#s.dependency 'SDWebImage', '~> 4.0.0'


end
