Pod::Spec.new do |s|
  s.name      = 'OPaySDK'
  s.version   = '2'
  s.ios.deployment_target  = '8.0'

  s.summary   = '介接歐付寶相關SDK'
  s.homepage  = 'https://www.allpay.com.tw/'
  s.license   = {
    :type => 'MIT',
    :text => <<-LICENSE
              Copyright (C) 2011-2016, allPay
    LICENSE
  }

  s.author    = {
                  'Nixon' =>  'nixon.shih@allpay.com.tw'
                }

  s.source    = { :path => '.' }
  s.source_files  = "OPaySDK", "OPaySDK/**/*.{h,m}"

  s.frameworks    = 'Foundation', 'UIKit'
end

