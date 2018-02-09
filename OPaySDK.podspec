Pod::Spec.new do |s|
  s.name      = 'OPaySDK'
  s.version   = '1.1.0'
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
                  'o-pay' => 'techsupport@allpay.com.tw',
                  'alpha.lo' => 'alpha.lo@opay.tw',
                  'lamb-mei.yang' => 'lamb-mei.yang@opay.tw',
                  'aaron.yen' => 'aaron.yen@opay.tw',
                  'swallow.chiang' => 'swallow.chiang@opay.tw',
		  'daniel.chen' => 'daniel.chen@opay.tw'
                }

  s.source    = { :git => "https://github.com/o-pay/omobipay-thirdparty-ios.git", :tag => s.version.to_s  }
  s.source_files  = "OPaySDK", "OPaySDK/**/*.{h,m}"

  s.frameworks    = 'Foundation', 'UIKit'
end

