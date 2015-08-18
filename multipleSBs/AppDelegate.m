//
//  AppDelegate.m
//  multipleSBs
//
//  Created by PragmaPilot on 20/05/2015.
//  Copyright (c) 2015 PP. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setAppearance];
    
    // Configure the TabBarController with VCs from other SBs...
    //
    // 1. There must NOT be a "embeded" segue between the container (ViewController) and the UITabBarController (this will make storyboard to create a new instance)
    // 2. The UITabBarController must be instantiated manually and have it's viewControllers set explicitly
    // 3. The UITabBarController must be added as a child VC to the container
    // 4. The UITabBarController's VIEW must be added as a SUBVIEW of the VC's view.
    
    UINavigationController *navVC = (UINavigationController*) self.window.rootViewController;
    UIViewController *mainVC = navVC.topViewController;
    
    UITabBarController *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabBarController"];
    UIViewController *vc1 = [[UIStoryboard storyboardWithName:@"sb1" bundle:nil] instantiateViewControllerWithIdentifier:@"vc1"];
    UIViewController *vc2 = [[UIStoryboard storyboardWithName:@"sb2" bundle:nil] instantiateViewControllerWithIdentifier:@"vc2"];
    
    tabBar.viewControllers = @[vc1,vc2];

    [mainVC addChildViewController:tabBar];
    [mainVC.view addSubview:tabBar.view];
    
    return YES;
}

-(void)setAppearance
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
                                             forState:UIControlStateSelected];
}

@end
