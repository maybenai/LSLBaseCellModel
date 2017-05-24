#
#  Be sure to run `pod spec lint LSLBaseMainTableViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "LSLBaseMainTableViewController"
    s.version      = "0.0.4"
    s.summary      = "initilize tableView cell"

    s.homepage     = "https://github.com/maybenai/LSLBaseCellModel"

    s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

    s.author             = { "maybenai" => "1014720511@qq.com" }


    s.platform     = :ios, "8.0"

    s.source       = { :git => "https://github.com/maybenai/LSLBaseCellModel.git", :tag => "0.0.4" }

    s.source_files  = "LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLMainCellModel.h"

    s.requires_arc = true


   s.subspec 'LSLBaseContoller' do |ss|

        ss.source_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseContoller/*'
  ss.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseContoller/**/*.h'
   end


s.subspec 'LSLBaseModel' do |ss|

       ss.source_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseModel/**/*'
       ss.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseModel/**/*.h'
   end


   s.subspec 'LSLBaseView' do |ss|

        ss.source_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseView/**/*'
       ss.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseView/**/*.h'
   end

   s.subspec 'LSLCategory' do |ss|

       ss.source_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLCategory/**/*'

       ss.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLCategory/**/*.h'
   end

   s.subspec 'LSLConst' do |ss|

       ss.source_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLConst/**/*'
       ss.public_header_files = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLConst/**/*.h'
   end

   s.subspec 'LSLResource' do |ss|

       ss.resource = 'LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLBaseMainTableViewController/LSLResource/**/*.png'

   end


end
