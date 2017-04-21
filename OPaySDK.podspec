Pod::Spec.new do |s|
  s.name      = 'OPaySDK'
  s.version   = '2'
  s.ios.deployment_target  = '8.0'

  s.summary   = 'Super Awesome Easy to use OPay iOS App trade SDK.'
  s.homepage  = 'https://www.allpay.com.tw/'
  s.license   = {
    :type => 'MIT',
    :text => <<-LICENSE
              Copyright © 2017 OPay Electronic Payment Co., Ltd. All rights reserved.
    LICENSE
  }

  s.author    = {
                  'Nixon' =>  'techsupport@allpay.com.tw'
                }

  s.source    = { :path => '.' }
  s.source_files  = "OPaySDK", "OPaySDK/**/*.{h,m}"

  s.frameworks    = 'Foundation', 'UIKit'
end

