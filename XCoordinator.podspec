Pod::Spec.new do |spec|
    spec.name         = 'XCoordinator'
    spec.version      = '2.3.1'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/gismart/GLXCoordinator.git'
    spec.authors      = { 'Stefan Kofler' => 'stefan.kofler@quickbirdstudios.com', 'Paul Kraft' => 'pauljohannes.kraft@quickbirdstudios.com' }
    spec.summary      = 'Navigation framework based on coordinator pattern.'
    spec.source       = { :git => 'git@github.com:gismart/GLXCoordinator.git', :tag => spec.version }
    spec.module_name = 'XCoordinator'
    spec.swift_version = '6'
    spec.ios.deployment_target = '16.0'
    spec.source_files = 'Sources/XCoordinator/*.swift'
    spec.default_subspec = 'Core'

    spec.pod_target_xcconfig = {
      'SWIFT_APPROACHABLE_CONCURRENCY' => 'YES',
      'SWIFT_DEFAULT_ACTOR_ISOLATION' => 'MainActor'
    }

    spec.subspec 'Core' do |ss|
        ss.source_files = 'Sources/XCoordinator/*.swift'
        ss.framework  = 'UIKit'
    end

    spec.subspec 'Combine' do |ss|
        ss.dependency 'XCoordinator/Core'
        ss.source_files = 'Sources/XCoordinatorCombine/*.swift'
    end
end
